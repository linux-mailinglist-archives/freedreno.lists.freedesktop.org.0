Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DC3F5A0B
	for <lists+freedreno@lfdr.de>; Fri,  8 Nov 2019 22:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B816E0DD;
	Fri,  8 Nov 2019 21:43:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E01B6E0DD
 for <freedreno@lists.freedesktop.org>; Fri,  8 Nov 2019 21:42:58 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1N3sye-1hkxG40Ils-00zl9w; Fri, 08 Nov 2019 22:37:20 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: y2038@lists.linaro.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Fri,  8 Nov 2019 22:32:52 +0100
Message-Id: <20191108213257.3097633-15-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191108213257.3097633-1-arnd@arndb.de>
References: <20191108213257.3097633-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:RjEXZPsu7wpFhVxxI0dg1gh3Sz1Hs1tSIhY/d+ypW54uoydpUSG
 AmGQqqAY8JV5SlTDcXhYy28Cbwi6/UGOCD0adGaB381dFQFh/45M+dKBA0PhUP+o9KaobMD
 qQ4+kG6gGE9DhvaaTxM/81sndh8nhZ8P0Vu53TlGZW7N7R5T5iUpKVXTQlPxMFUkAtL5rs2
 msQ7tFAGZ+6hiDk9RernQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eA86yZf6GNw=:lVM3R9IkAvE63EI+o1vC8U
 AJi+2KCzTUr9NRWrnRX8iacA5V5zLLnsJR9+dOQWxKSufrZ/UiOFQ6iavf2yYP4RxyORDamEB
 WOqzkEoBjcfxikCHcsuBR1b3r1wVepo++W6uQ0m3kBnMhmZB4Tjvpku2tlvEs6B29qGpVOA92
 E9zoj2HA1RPzOXFq+W14hPfX+7pP7NIXrndqG8N04aOee4Ld//FKEj25WfOdACXQRg46p2v2T
 /Tj3kxC1sbEAV4tilx+d2aln7cNNtilv1AsMmXJ4h8Nt3OiJe9aX6L6mwJzBwcLLctzfAwokd
 KMR5Je996Cbtw2svBqwlsUl9VJCBt4D2AR2X+tWTqWoBrNiOGZWwhcD5PcyOGL5b9MS9aRV8K
 yiFvvbV8/bd4hXfT0T5ysA4OMSD+kHYl3bJzKuyotATIxrDZfugTF0Ui9bBSnyzc7ELwVdiFO
 9ZKa0SEdxR2IN5pwcxQECGMoDtXdfsqytOanWRaF+mQcA8bxrV1NdZVdNpXJ1Y3S2XAZzTL97
 vs3WHeV3U3Z1wy2WadYdM2uUJhTSP4RESmekuGk5GfXjCajNm671Up4NlgonUu/ZVhHeLxPUI
 XZeeb69/4fDC4m4gK1Fv9myHn9oWDCzOrAelTaEI+YmHpuDX3ZfijN50w/vniRDVevAa9xtZp
 iRSJvMhXhqyPI6hSRLa5WALezIxUgWVSPY6b/GsSp1eEoEqei3/6Ta6iJ2qvgGIcuLZiFJPEl
 1JeTnITMilNuo17fySZ0u/Vmkh2x5xb5hmGrvjcdcURN/kujgFYM6+cFginxOrwvAAxvxb5Gz
 Bbb8DVakCSj4pFKPfoEO9ZXYCsrpmz24OjM/lsy3q2g3NHAz+VNn4HV2/8xTNQSEfv2vjf1Vd
 0cU/CGNPcdEDDdjffpdQ==
Subject: [Freedreno] [PATCH 14/16] drm/msm: avoid using 'timespec'
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 "Kristian H. Kristensen" <hoegsberg@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jordan Crouse <jcrouse@codeaurora.org>,
 Joe Perches <joe@perches.com>, Jeykumar Sankaran <jsanka@codeaurora.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

VGhlIHRpbWVzcGVjIHN0cnVjdHVyZSBhbmQgYXNzb2NpYXRlZCBpbnRlcmZhY2VzIGFyZSBkZXBy
ZWNhdGVkIGFuZCB3aWxsCmJlIHJlbW92ZWQgaW4gdGhlIGZ1dHVyZSBiZWNhdXNlIG9mIHRoZSB5
MjAzOCBvdmVyZmxvdy4KClRoZSB1c2Ugb2Yga3RpbWVfdG9fdGltZXNwZWMoKSBpbiB0aW1lb3V0
X3RvX2ppZmZpZXMoKSBkb2VzIG5vdApzdWZmZXIgZnJvbSB0aGF0IG92ZXJmbG93LCBidXQgaXMg
ZWFzeSB0byBhdm9pZCBieSBqdXN0IGNvbnZlcnRpbmcKdGhlIGt0aW1lX3QgaW50byBqaWZmaWVz
IGRpcmVjdGx5LgoKU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuaCB8IDMgKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL21zbS9tc21fZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuaAppbmRl
eCA3MTU0N2U3NTZlMjkuLjc0MGJmN2M3MGQ4ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21zbS9tc21fZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmgKQEAgLTQ1
NCw4ICs0NTQsNyBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgdGltZW91dF90b19qaWZm
aWVzKGNvbnN0IGt0aW1lX3QgKnRpbWVvdXQpCiAJCXJlbWFpbmluZ19qaWZmaWVzID0gMDsKIAl9
IGVsc2UgewogCQlrdGltZV90IHJlbSA9IGt0aW1lX3N1YigqdGltZW91dCwgbm93KTsKLQkJc3Ry
dWN0IHRpbWVzcGVjIHRzID0ga3RpbWVfdG9fdGltZXNwZWMocmVtKTsKLQkJcmVtYWluaW5nX2pp
ZmZpZXMgPSB0aW1lc3BlY190b19qaWZmaWVzKCZ0cyk7CisJCXJlbWFpbmluZ19qaWZmaWVzID0g
a3RpbWVfZGl2bnMocmVtLCBOU0VDX1BFUl9TRUMgLyBIWik7CiAJfQogCiAJcmV0dXJuIHJlbWFp
bmluZ19qaWZmaWVzOwotLSAKMi4yMC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9mcmVlZHJlbm8=
