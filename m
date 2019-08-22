Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 686B3996ED
	for <lists+freedreno@lfdr.de>; Thu, 22 Aug 2019 16:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA686EB70;
	Thu, 22 Aug 2019 14:37:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EE76EB79;
 Thu, 22 Aug 2019 14:37:36 +0000 (UTC)
Received: from ins7386.localdomain (unknown [207.110.43.92])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 4DA7B4BB69;
 Thu, 22 Aug 2019 14:37:34 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
 robh+dt@kernel.org, bjorn.andersson@linaro.org
Date: Thu, 22 Aug 2019 07:37:03 -0700
Message-Id: <20190822143703.13030-8-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822143703.13030-1-masneyb@onstation.org>
References: <20190822143703.13030-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1566484655;
 bh=GuDTYaLtRS6VZNi4k8Kar+jH90CMSgZMuAHOBomIJfY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c8S1G5EV6qFXdTZwEeL6EdIRVCWHpelgf+iieIqoON68BKn9WO8d2AKIdunPkUjtq
 /JrJRpdC3qp8GIGmwjmEbgqJDDWP6RG8trZWOLwMppevFtmp2J1J218SQVjumed4pe
 lDqxDsMkyLltlPrYX+fCsvmVEHrMf4jlA8/pwH+4=
Subject: [Freedreno] [PATCH v6 7/7] ARM: qcom_defconfig: add ocmem support
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
b24ub3JnPgotLS0KQ2hhbmdlcyBzaW5jZSB2NToKLSBOb25lCgpUaGlzIHBhdGNoIHdhcyBpbnRy
b2R1Y2VkIGluIHY1LgoKIGFyY2gvYXJtL2NvbmZpZ3MvcWNvbV9kZWZjb25maWcgfCAxICsKIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2NvbmZp
Z3MvcWNvbV9kZWZjb25maWcgYi9hcmNoL2FybS9jb25maWdzL3Fjb21fZGVmY29uZmlnCmluZGV4
IDM0NDMzYmY1ODg1ZC4uNTk1ZTE5MTBiYTc4IDEwMDY0NAotLS0gYS9hcmNoL2FybS9jb25maWdz
L3Fjb21fZGVmY29uZmlnCisrKyBiL2FyY2gvYXJtL2NvbmZpZ3MvcWNvbV9kZWZjb25maWcKQEAg
LTIyNSw2ICsyMjUsNyBAQCBDT05GSUdfUUNPTV9XQ05TU19QSUw9eQogQ09ORklHX1JQTVNHX0NI
QVI9eQogQ09ORklHX1JQTVNHX1FDT01fU01EPXkKIENPTkZJR19RQ09NX0dTQkk9eQorQ09ORklH
X1FDT01fT0NNRU09eQogQ09ORklHX1FDT01fUE09eQogQ09ORklHX1FDT01fU01FTT15CiBDT05G
SUdfUUNPTV9TTURfUlBNPXkKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZnJlZWRyZW5v
