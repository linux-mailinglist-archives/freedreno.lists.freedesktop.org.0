Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBACAD20F8
	for <lists+freedreno@lfdr.de>; Thu, 10 Oct 2019 08:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690C56EA9A;
	Thu, 10 Oct 2019 06:48:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123F06EA99;
 Thu, 10 Oct 2019 06:48:07 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 68E07F745D4B8C299010;
 Thu, 10 Oct 2019 14:48:02 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Thu, 10 Oct 2019
 14:47:55 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <robdclark@chromium.org>, <sean@poorly.run>, <airlied@linux.ie>,
 <bjorn.andersson@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Date: Thu, 10 Oct 2019 14:55:02 +0800
Message-ID: <1570690506-83287-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Subject: [Freedreno] [PATCH 0/4] drm/msm: Remove four set but not used
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

emhlbmdiaW4gKDQpOgogIGRybS9tc20vbWRwNTogUmVtb3ZlIHNldCBidXQgbm90IHVzZWQgdmFy
aWFibGUgJ2ZtdCcKICBkcm0vbXNtL21kcDU6IFJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlh
YmxlICdod19jZmcnIGluIGJsZW5kX3NldHVwCiAgZHJtL21zbS9kc2k6IFJlbW92ZSBzZXQgYnV0
IG5vdCB1c2VkIHZhcmlhYmxlICdscHgnCiAgZHJtL21zbS9kc2k6IFJlbW92ZSBzZXQgYnV0IG5v
dCB1c2VkIHZhcmlhYmxlICdscCcKCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1
X2NydGMuYyB8IDMgLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X3NtcC5j
ICB8IDIgLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9ob3N0LmMgICAgICAgIHwgMyAr
LS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmMgICAgIHwgNiArKy0tLS0K
IDQgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCi0tCjIu
Ny40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVl
ZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=
