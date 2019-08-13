Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 439728BBE2
	for <lists+freedreno@lfdr.de>; Tue, 13 Aug 2019 16:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032AB6E15A;
	Tue, 13 Aug 2019 14:46:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49B26E15A
 for <freedreno@lists.freedesktop.org>; Tue, 13 Aug 2019 14:46:35 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 919C560C8B; Tue, 13 Aug 2019 14:46:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DDA83608FF;
 Tue, 13 Aug 2019 14:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DDA83608FF
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Tue, 13 Aug 2019 08:46:25 -0600
Message-Id: <1565707585-5359-2-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565707585-5359-1-git-send-email-jcrouse@codeaurora.org>
References: <1565707585-5359-1-git-send-email-jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1565707595;
 bh=2IoyEMqIXK1S5ig0MQsZwXaRBSkNTdyKo/J01X/b8o4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=binOB4RxeVdG9W8RkU+Rh78mamw4a8qfbga6TRKfhjce7ijyBUJcbaUS09IczLst0
 HkoSI7cfoQ7aOb6PIQeykv7dOmZZWYzKw0tj7b81oUA6KRRXspualcDS4QJLpbOnsC
 HSS2oKJCThF6XDQF5YELIFEfS2H6u2cJ+HZNZmYw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1565707593;
 bh=2IoyEMqIXK1S5ig0MQsZwXaRBSkNTdyKo/J01X/b8o4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Oj2alQPlJikRq38cn+AQr57B198EMQJbTPoCBATnYp9x6QUiMvPZsxsKmGkDwQUtF
 mDTQC/KCsFYs54Y0Q2ta2pkXSSBUXKKqIkx7Y+br313ufb0NQK5mSrdJyafiQKEsR8
 OU3Fvsthkx8IrWwUQshL554z9DoIEIM5OWgBlqXQ=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
Subject: [Freedreno] [PATCH v2 2/2] arm: Add DRM_MSM to defconfigs with
 ARCH_QCOM
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Leonard Crestez <leonard.crestez@nxp.com>, Will Deacon <will@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Anson Huang <Anson.Huang@nxp.com>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Andy Gross <agross@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Brian Masney <masneyb@onstation.org>,
 Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Simon Horman <horms+renesas@verge.net.au>,
 Fabrice Gasnier <fabrice.gasnier@st.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Olof Johansson <olof@lixom.net>,
 Shawn Guo <shawnguo@kernel.org>, Frank Rowand <frank.rowand@sony.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Tm93IHRoYXQgQ09ORklHX0RSTV9NU00gaXMgbm8gbG9uZ2VyIGRlZmF1bHQgJ3knIGFkZCBpdCBh
cyBhIG1vZHVsZSB0byBhbGwKQVJDSF9RQ09NIGVuYWJsZWQgZGVmY29uZmlncyB0byByZXN0b3Jl
IHRoZSBwcmV2aW91cyBleHBlY3RlZCBidWlsZApiZWhhdmlvci4KClNpZ25lZC1vZmYtYnk6IEpv
cmRhbiBDcm91c2UgPGpjcm91c2VAY29kZWF1cm9yYS5vcmc+Ci0tLQoKIGFyY2gvYXJtL2NvbmZp
Z3MvbXVsdGlfdjdfZGVmY29uZmlnIHwgMSArCiBhcmNoL2FybS9jb25maWdzL3Fjb21fZGVmY29u
ZmlnICAgICB8IDEgKwogYXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZpZyAgICAgICAgfCAxICsK
IDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0v
Y29uZmlncy9tdWx0aV92N19kZWZjb25maWcgYi9hcmNoL2FybS9jb25maWdzL211bHRpX3Y3X2Rl
ZmNvbmZpZwppbmRleCBiMGEwNTY4Li4xMmRmZGFiIDEwMDY0NAotLS0gYS9hcmNoL2FybS9jb25m
aWdzL211bHRpX3Y3X2RlZmNvbmZpZworKysgYi9hcmNoL2FybS9jb25maWdzL211bHRpX3Y3X2Rl
ZmNvbmZpZwpAQCAtNjM1LDYgKzYzNSw3IEBAIENPTkZJR19EUk1fQVRNRUxfSExDREM9bQogQ09O
RklHX0RSTV9SQ0FSX0RVPW0KIENPTkZJR19EUk1fUkNBUl9MVkRTPXkKIENPTkZJR19EUk1fU1VO
NEk9bQorQ09ORklHX0RSTV9NU009bQogQ09ORklHX0RSTV9GU0xfRENVPW0KIENPTkZJR19EUk1f
VEVHUkE9eQogQ09ORklHX0RSTV9TVE09bQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vY29uZmlncy9x
Y29tX2RlZmNvbmZpZyBiL2FyY2gvYXJtL2NvbmZpZ3MvcWNvbV9kZWZjb25maWcKaW5kZXggMzQ0
MzNiZi4uMDJmMWU3YiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vY29uZmlncy9xY29tX2RlZmNvbmZp
ZworKysgYi9hcmNoL2FybS9jb25maWdzL3Fjb21fZGVmY29uZmlnCkBAIC0xNDcsNiArMTQ3LDcg
QEAgQ09ORklHX1JFR1VMQVRPUl9RQ09NX1NNRF9SUE09eQogQ09ORklHX1JFR1VMQVRPUl9RQ09N
X1NQTUk9eQogQ09ORklHX01FRElBX1NVUFBPUlQ9eQogQ09ORklHX0RSTT15CitDT05GSUdfRFJN
X01TTT1tCiBDT05GSUdfRFJNX1BBTkVMX1NJTVBMRT15CiBDT05GSUdfRkI9eQogQ09ORklHX0ZS
QU1FQlVGRkVSX0NPTlNPTEU9eQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9jb25maWdzL2RlZmNv
bmZpZyBiL2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcKaW5kZXggMWNkNjZjZi4uNGZlYzdh
OSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZpZworKysgYi9hcmNoL2Fy
bTY0L2NvbmZpZ3MvZGVmY29uZmlnCkBAIC01MzEsNiArNTMxLDcgQEAgQ09ORklHX0RSTV9SQ0FS
X0RVPW0KIENPTkZJR19EUk1fU1VONEk9bQogQ09ORklHX0RSTV9TVU44SV9EV19IRE1JPW0KIENP
TkZJR19EUk1fU1VOOElfTUlYRVI9bQorQ09ORklHX0RSTV9NU009bQogQ09ORklHX0RSTV9URUdS
QT1tCiBDT05GSUdfRFJNX1BBTkVMX1NJTVBMRT1tCiBDT05GSUdfRFJNX1NJSTkwMlg9bQotLSAK
Mi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZy
ZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==
