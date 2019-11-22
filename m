Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E8F105E29
	for <lists+freedreno@lfdr.de>; Fri, 22 Nov 2019 02:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291786F4C9;
	Fri, 22 Nov 2019 01:26:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF62D6EF2E;
 Fri, 22 Nov 2019 01:26:57 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 482153EE6F;
 Fri, 22 Nov 2019 01:26:56 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com,
	sean@poorly.run,
	robh+dt@kernel.org
Date: Thu, 21 Nov 2019 20:26:41 -0500
Message-Id: <20191122012645.7430-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1574386016;
 bh=Kq+RNFpqhutChH3/+5/pT8eAUKeDkBlnAGwXIrYo9xI=;
 h=From:To:Cc:Subject:Date:From;
 b=RL09JusxKP7Q2NBDbvwmFjeJDGHFW1vkN8cZqS9rqhpxdQEmg8v8HesxPW00j66BV
 sS3yuBiW71E5aQ2H7bC/JjONlWFZD/JANow9HKUK8ETpVKrC3PqkDvI7cMXd4n2fA8
 FNB9N6NYZYQJkBT8RFVJ7+82hbn702AWaMIEo8fY=
Subject: [Freedreno] [PATCH v2 0/4] drm/msm/gpu: add support for ocmem
 interconnect
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jcrouse@codeaurora.org, daniel@ffwll.ch, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

U29tZSBBM3h4IGFuZCBhbGwgQTR4eCBBZHJlbm8gR1BVcyBkbyBub3QgaGF2ZSBHTUVNIGluc2lk
ZSB0aGUgR1BVIGNvcmUKYW5kIG11c3QgdXNlIHRoZSBPbiBDaGlwIE1FTW9yeSAoT0NNRU0pIGlu
IG9yZGVyIHRvIGJlIGZ1bmN0aW9uYWwuClRoZXJlJ3MgYSBzZXBhcmF0ZSBpbnRlcmNvbm5lY3Qg
cGF0aCB0aGF0IG5lZWRzIHRvIGJlIHNldHVwIHRvIE9DTUVNLgpUaGlzIHBhdGNoIHNlcmllcyBh
ZGRzIHN1cHBvcnQgZm9yIHRoYXQgcGF0aCwgYW5kIHNldHMgdGhlIHZvdGVzIGZvciB0aGUKdHdv
IGludGVyY29ubmVjdCBwYXRocyB0byB0aGUgaGlnaGVzdCBzcGVlZCBmb3IgYTN4eCBhbmQgYTR4
eC1iYXNlZApwbGF0Zm9ybXMuCgpDaGFuZ2VzIHNpbmNlIHYxOgotIERvbid0IHJlbmFtZSBpY2Nf
cGF0aCB0byBnZnhfbWVtX2ljY19wYXRoLiBMZWF2ZSBleGlzdGluZyB2YXJpYWJsZQogIG5hbWVk
IGFzIGlzIGFuZCBhZGQgY29tbWVudCB0byBkZWNsYXJhdGlvbiBpbiBzdHJ1Y3QgbXNtX2dwdS4K
CkJyaWFuIE1hc25leSAoNCk6CiAgZHQtYmluZGluZ3M6IGRybS9tc20vZ3B1OiBkb2N1bWVudCBz
ZWNvbmQgaW50ZXJjb25uZWN0CiAgZHJtL21zbS9ncHU6IGFkZCBzdXBwb3J0IGZvciBvY21lbSBp
bnRlcmNvbm5lY3QgcGF0aAogIGRybS9tc20vYTN4eDogc2V0IGludGVyY29ubmVjdCBiYW5kd2lk
dGggdm90ZQogIGRybS9tc20vYTR4eDogc2V0IGludGVyY29ubmVjdCBiYW5kd2lkdGggdm90ZQoK
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXNtL2dwdS50eHQgICAgICAgIHwgIDYg
KysrKystCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hM3h4X2dwdS5jICAgICAgICAgICAg
ICB8ICA4ICsrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNHh4X2dwdS5jICAg
ICAgICAgICAgICB8ICA4ICsrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJl
bm9fZ3B1LmMgICAgICAgICAgICB8IDE0ICsrKysrKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0v
bXNtL21zbV9ncHUuaCAgICAgICAgICAgICAgICAgICAgICB8ICA3ICsrKysrKysKIDUgZmlsZXMg
Y2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tIAoyLjIxLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBt
YWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==
