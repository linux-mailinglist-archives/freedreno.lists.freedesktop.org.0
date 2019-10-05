Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B669CD37F
	for <lists+freedreno@lfdr.de>; Sun,  6 Oct 2019 18:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C498E6E0BA;
	Sun,  6 Oct 2019 16:31:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE486E113
 for <freedreno@lists.freedesktop.org>; Sat,  5 Oct 2019 04:42:07 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 2A4AB89BBE25790B73C1;
 Sat,  5 Oct 2019 12:26:45 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Sat, 5 Oct 2019
 12:26:37 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <jsanka@codeaurora.org>, <jcrouse@codeaurora.org>,
 <gregkh@linuxfoundation.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Date: Sat, 5 Oct 2019 12:33:43 +0800
Message-ID: <1570250029-67639-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 06 Oct 2019 16:31:22 +0000
Subject: [Freedreno] [PATCH 0/6] drm/msm/dpu: Remove some set but not used
 variables
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

emhlbmdiaW4gKDYpOgogIGRybS9tc20vZHB1OiBSZW1vdmUgc2V0IGJ1dCBub3QgdXNlZCB2YXJp
YWJsZSAncHJpdicgaW4gZHB1X2ttcy5jCiAgZHJtL21zbS9kcHU6IFJlbW92ZSBzZXQgYnV0IG5v
dCB1c2VkIHZhcmlhYmxlICdwcml2JyBpbgogICAgZHB1X2VuY29kZXJfcGh5c192aWQuYwogIGRy
bS9tc20vZHB1OiBSZW1vdmUgc2V0IGJ1dCBub3QgdXNlZCB2YXJpYWJsZSAncHJpdicgaW4gZHB1
X2NvcmVfaXJxLmMKICBkcm0vbXNtL2RwdTogUmVtb3ZlIHNldCBidXQgbm90IHVzZWQgdmFyaWFi
bGVzICdkcHVfY3N0YXRlJywncHJpdicKICBkcm0vbXNtL2RwdTogUmVtb3ZlIHNldCBidXQgbm90
IHVzZWQgdmFyaWFibGVzICdjbWRfZW5jJywncHJpdicKICBkcm0vbXNtL2RwdTogUmVtb3ZlIHNl
dCBidXQgbm90IHVzZWQgdmFyaWFibGVzICdtb2RlJywnZHB1X2ttcycsJ3ByaXYnCgogZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NvcmVfaXJxLmMgICAgICAgICB8ICA0IC0tLS0K
IGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jb3JlX3BlcmYuYyAgICAgICAgfCAg
NCAtLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5jICAgICAg
ICAgIHwgIDcgLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29k
ZXJfcGh5c19jbWQuYyB8IDExIC0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3Av
ZHB1MS9kcHVfZW5jb2Rlcl9waHlzX3ZpZC5jIHwgIDIgLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20v
ZGlzcC9kcHUxL2RwdV9rbXMuYyAgICAgICAgICAgICAgfCAgNCAtLS0tCiA2IGZpbGVzIGNoYW5n
ZWQsIDMyIGRlbGV0aW9ucygtKQoKLS0KMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2ZyZWVkcmVubw==
