Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DFB2E6A2
	for <lists+freedreno@lfdr.de>; Wed, 29 May 2019 22:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639CB6E0E2;
	Wed, 29 May 2019 20:55:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635E66E0F0;
 Wed, 29 May 2019 20:55:34 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 1BF376177A; Wed, 29 May 2019 20:55:30 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A4616616B8;
 Wed, 29 May 2019 20:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A4616616B8
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Wed, 29 May 2019 14:54:44 -0600
Message-Id: <1559163292-4792-9-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
References: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559163334;
 bh=YbD1o3QTKsJc4Zlft7yYAtBneOymuecIq+BLGIcWNb8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ep2pnSl2ZoaT6WMCGII3T905YRQ401enAsz1ZMEeGvgla8cWuRUr5cjtxMM7Rxvq9
 A4T4wQXhEr666vbzOh4M2SRFbqnBlzlY4mhDYf0w17cNoBDB+ZPZ8JfnPQl0hB62pY
 FBnI9wr+wc6SGvrQQcH4bgAK7NpApHYW++no8irw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559163329;
 bh=YbD1o3QTKsJc4Zlft7yYAtBneOymuecIq+BLGIcWNb8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nYHYkyZJa+Lai5q8jqcgeBcDrEj6cQB62keJdOHVhbcNkhiNKBKQEn4nVWpyDFsui
 jsPKrwoJ57vFozh20pqRBWWpA9JbdrhdyZ8yqz+GPvvyQHnNA8qH5xmFUepULKgJWn
 9XoPVBQKH3+h3Q8AT9R+CYggtVxjMUwIfmoarMy8=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
Subject: [Freedreno] [PATCH v3 08/16] drm/msm: Print all 64 bits of the
 faulting IOMMU address
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
Cc: jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, hoegsberg@google.com,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

V2hlbiB3ZSBtb3ZlIHRvIDY0IGJpdCBhZGRyZXNzaW5nIGZvciBhNXh4IGFuZCBhNnh4IHRhcmdl
dHMgd2Ugd2lsbCBzdGFydApzZWVpbmcgcGFnZWZhdWx0cyBhdCBsYXJnZXIgYWRkcmVzc2VzIHNv
IGZvcm1hdCB0aGVtIGFwcHJvcHJpYXRlbHkgaW4gdGhlCmxvZyBtZXNzYWdlIGZvciBlYXNpZXIg
ZGVidWdnaW5nLgoKU2lnbmVkLW9mZi1ieTogSm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVy
b3JhLm9yZz4KLS0tCgogZHJpdmVycy9ncHUvZHJtL21zbS9tc21faW9tbXUuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2lvbW11LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21z
bV9pb21tdS5jCmluZGV4IDEyYmI1NGMuLjE5MjYzMjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tc20vbXNtX2lvbW11LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21faW9tbXUu
YwpAQCAtMzAsNyArMzAsNyBAQCBzdGF0aWMgaW50IG1zbV9mYXVsdF9oYW5kbGVyKHN0cnVjdCBp
b21tdV9kb21haW4gKmRvbWFpbiwgc3RydWN0IGRldmljZSAqZGV2LAogCXN0cnVjdCBtc21faW9t
bXUgKmlvbW11ID0gYXJnOwogCWlmIChpb21tdS0+YmFzZS5oYW5kbGVyKQogCQlyZXR1cm4gaW9t
bXUtPmJhc2UuaGFuZGxlcihpb21tdS0+YmFzZS5hcmcsIGlvdmEsIGZsYWdzKTsKLQlwcl93YXJu
X3JhdGVsaW1pdGVkKCIqKiogZmF1bHQ6IGlvdmE9JTA4bHgsIGZsYWdzPSVkXG4iLCBpb3ZhLCBm
bGFncyk7CisJcHJfd2Fybl9yYXRlbGltaXRlZCgiKioqIGZhdWx0OiBpb3ZhPSUxNmx4LCBmbGFn
cz0lZFxuIiwgaW92YSwgZmxhZ3MpOwogCXJldHVybiAwOwogfQogCi0tIAoyLjcuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxp
bmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v
