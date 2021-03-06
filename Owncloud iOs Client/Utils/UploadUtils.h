//
//  UploadUtils.h
//  Owncloud iOs Client
//
//  Created by Gonzalo Gonzalez on 04/07/13.
//

/*
 Copyright (C) 2014, ownCloud, Inc.
 This code is covered by the GNU Public License Version 3.
 For distribution utilizing Apple mechanisms please see https://owncloud.org/contribute/iOS-license-exception/
 You should have received a copy of this license
 along with this program. If not, see <http://www.gnu.org/licenses/gpl-3.0.en.html>.
 */

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>

@class FileDto;
@class UploadsOfflineDto;

extern NSString * PreviewFileNotification;

@interface UploadUtils : NSObject

/*
 * Method tha make the lengt of the file
 */
+ (NSString *)makeLengthString:(long)estimateLength;

/*
 * Method that make the path string
 */
+ (NSString *)makePathString:(NSString *)destinyFolder withUserUrl:(NSString *)userUrl;

/*
 *Method that updates a downloaded file when the user overwrites this file
 */
+(void) updateOverwritenFile:(FileDto *)file FromPath:(NSString *)path;

+ (NSString *) getUrlWithRedirectionByOriginalURL:(NSString *) originalUrl;

+ (FileDto *) getFileDtoByUploadOffline:(UploadsOfflineDto *) uploadsOfflineDto;

+ (ALAssetsLibrary *)defaultAssetsLibrary;

@end


