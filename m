Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B4DD1232
	for <lists+freedreno@lfdr.de>; Wed,  9 Oct 2019 17:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12B56E9D2;
	Wed,  9 Oct 2019 15:13:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0526E98C
 for <freedreno@lists.freedesktop.org>; Wed,  9 Oct 2019 12:19:21 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iIAPy-0004SC-Kz; Wed, 09 Oct 2019 12:46:10 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iIAPx-0000C5-9t; Wed, 09 Oct 2019 12:46:09 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@lists.codethink.co.uk
Date: Wed,  9 Oct 2019 12:46:07 +0100
Message-Id: <20191009114607.701-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Oct 2019 15:13:42 +0000
Subject: [Freedreno] [PATCH] drm/msm: make a5xx_show and a5xx_gpu_state_put
 static
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

VGhlIGE1eHhfc2hvdyBhbmQgYTV4eF9ncHVfc3RhdGVfcHV0IG9iamVjdHMgYXJlIG5vdCBleHBv
cnRlZApvdXRzaWRlIG9mIHRoZSBmaWxlLCBzbyBtYWtlIHRoZW0gc3RhdGljIHRvIGF2b2lkIHRo
ZSBmb2xsb3dpbmcKd2FybmluZ3MgZnJvbSBzcGFyc2U6Cgpkcml2ZXJzL2dwdS9kcm0vbXNtL2Fk
cmVuby9hNXh4X2dwdS5jOjEyOTI6NTogd2FybmluZzogc3ltYm9sICdhNXh4X2dwdV9zdGF0ZV9w
dXQnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/CmRyaXZlcnMvZ3B1L2Ry
bS9tc20vYWRyZW5vL2E1eHhfZ3B1LmM6MTMwMjo2OiB3YXJuaW5nOiBzeW1ib2wgJ2E1eHhfc2hv
dycgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KClNpZ25lZC1vZmYtYnk6
IEJlbiBEb29rcyA8YmVuLmRvb2tzQGNvZGV0aGluay5jby51az4KLS0tCkNjOiBSb2IgQ2xhcmsg
PHJvYmRjbGFya0BnbWFpbC5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6
IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4KQ2M6IGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnCkNjOiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTV4eF9ncHUuYyB8IDYgKysrLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E1eHhfZ3B1LmMgYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL2FkcmVuby9hNXh4X2dwdS5jCmluZGV4IGU5YzU1ZDFkNmMwNC4uN2ZkYzllMmJj
YWFjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4X2dwdS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E1eHhfZ3B1LmMKQEAgLTEyODksNyArMTI4
OSw3IEBAIHN0YXRpYyB2b2lkIGE1eHhfZ3B1X3N0YXRlX2Rlc3Ryb3koc3RydWN0IGtyZWYgKmty
ZWYpCiAJa2ZyZWUoYTV4eF9zdGF0ZSk7CiB9CiAKLWludCBhNXh4X2dwdV9zdGF0ZV9wdXQoc3Ry
dWN0IG1zbV9ncHVfc3RhdGUgKnN0YXRlKQorc3RhdGljIGludCBhNXh4X2dwdV9zdGF0ZV9wdXQo
c3RydWN0IG1zbV9ncHVfc3RhdGUgKnN0YXRlKQogewogCWlmIChJU19FUlJfT1JfTlVMTChzdGF0
ZSkpCiAJCXJldHVybiAxOwpAQCAtMTI5OSw4ICsxMjk5LDggQEAgaW50IGE1eHhfZ3B1X3N0YXRl
X3B1dChzdHJ1Y3QgbXNtX2dwdV9zdGF0ZSAqc3RhdGUpCiAKIAogI2lmIGRlZmluZWQoQ09ORklH
X0RFQlVHX0ZTKSB8fCBkZWZpbmVkKENPTkZJR19ERVZfQ09SRURVTVApCi12b2lkIGE1eHhfc2hv
dyhzdHJ1Y3QgbXNtX2dwdSAqZ3B1LCBzdHJ1Y3QgbXNtX2dwdV9zdGF0ZSAqc3RhdGUsCi0JCXN0
cnVjdCBkcm1fcHJpbnRlciAqcCkKK3N0YXRpYyB2b2lkIGE1eHhfc2hvdyhzdHJ1Y3QgbXNtX2dw
dSAqZ3B1LCBzdHJ1Y3QgbXNtX2dwdV9zdGF0ZSAqc3RhdGUsCisJCSAgICAgIHN0cnVjdCBkcm1f
cHJpbnRlciAqcCkKIHsKIAlpbnQgaSwgajsKIAl1MzIgcG9zID0gMDsKLS0gCjIuMjMuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1h
aWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v
