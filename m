Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E769AEF2
	for <lists+freedreno@lfdr.de>; Fri, 23 Aug 2019 14:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB1C6EC8D;
	Fri, 23 Aug 2019 12:17:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1862C6EC8A;
 Fri, 23 Aug 2019 12:17:02 +0000 (UTC)
Received: from localhost.localdomain (wsip-184-191-162-253.sd.sd.cox.net
 [184.191.162.253])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 23D7C3E8A5;
 Fri, 23 Aug 2019 12:17:00 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
 robh+dt@kernel.org, bjorn.andersson@linaro.org
Date: Fri, 23 Aug 2019 05:16:37 -0700
Message-Id: <20190823121637.5861-8-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190823121637.5861-1-masneyb@onstation.org>
References: <20190823121637.5861-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1566562621;
 bh=6Hv11UScrKxg7gOfOYLlr900WEfm2Wpv89bnNSptn6E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VFhXpCcAn5aoWr0Ip/RmGAFhGMunRFiH8tjLLKOgW0v6kgjPOYk61dWS/K2WaiEhl
 SabT9AuI9s52v1PSl+PxXz5HwNTBlTIj36ID2vVWI6UShqNoSNC6H8u5ggNhQPJqBB
 q72bulKWIkrzA9vWrvtaQZFE7k62hoK0LXgtGoSI=
Subject: [Freedreno] [PATCH v7 7/7] ARM: qcom_defconfig: add ocmem support
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jonathan@marek.ca,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jcrouse@codeaurora.org, daniel@ffwll.ch,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

QWRkIG9jbWVtIGRyaXZlciB0aGF0J3MgbmVlZGVkIGZvciBzb21lIGEzeHggYW5kIGE0eHggYmFz
ZWQgc3lzdGVtcy4KClNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRp
b24ub3JnPgotLS0KQ2hhbmdlcyBzaW5jZSB2NjoKLSBOb25lCgpDaGFuZ2VzIHNpbmNlIHY1Ogot
IE5vbmUKClRoaXMgcGF0Y2ggd2FzIGludHJvZHVjZWQgaW4gdjUuCgogYXJjaC9hcm0vY29uZmln
cy9xY29tX2RlZmNvbmZpZyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpk
aWZmIC0tZ2l0IGEvYXJjaC9hcm0vY29uZmlncy9xY29tX2RlZmNvbmZpZyBiL2FyY2gvYXJtL2Nv
bmZpZ3MvcWNvbV9kZWZjb25maWcKaW5kZXggMzQ0MzNiZjU4ODVkLi41OTVlMTkxMGJhNzggMTAw
NjQ0Ci0tLSBhL2FyY2gvYXJtL2NvbmZpZ3MvcWNvbV9kZWZjb25maWcKKysrIGIvYXJjaC9hcm0v
Y29uZmlncy9xY29tX2RlZmNvbmZpZwpAQCAtMjI1LDYgKzIyNSw3IEBAIENPTkZJR19RQ09NX1dD
TlNTX1BJTD15CiBDT05GSUdfUlBNU0dfQ0hBUj15CiBDT05GSUdfUlBNU0dfUUNPTV9TTUQ9eQog
Q09ORklHX1FDT01fR1NCST15CitDT05GSUdfUUNPTV9PQ01FTT15CiBDT05GSUdfUUNPTV9QTT15
CiBDT05GSUdfUUNPTV9TTUVNPXkKIENPTkZJR19RQ09NX1NNRF9SUE09eQotLSAKMi4yMS4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8g
bWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=
