Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FED38AD5B
	for <lists+freedreno@lfdr.de>; Thu, 20 May 2021 14:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82C3891C7;
	Thu, 20 May 2021 12:03:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D596F416
 for <freedreno@lists.freedesktop.org>; Thu, 20 May 2021 12:03:08 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id r12so17403006wrp.1
 for <freedreno@lists.freedesktop.org>; Thu, 20 May 2021 05:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w5nWdjb90GI2+TAkol2s0H4fVYowwMJxaadOSn6QcUY=;
 b=ECdngyCPXxuV8WED0vFl1Q/XPm49F6DBoppaIbs0HIcfo5XtnDejjHk8tkEzG01VqR
 VynFew87U48BK6UQOUZvX4hik/sKntYuwWjWHhskelw1Lwng6CXVxmjvJYLoh+5gDvFG
 wZTZ6uyJVOIYmg5bUoF2U8S961FxPN9UgvmdvJLprgOh2wDY45n4COM+p2y3GhU/jQ5e
 fukfyAfIzGVH+1KeEWfy8NFfvHqqUApjYjRh5l/GAxWnQZy//rm1pWAWrRvc6MU7kTp6
 MRfqdYUMvpTXpajmj7WC3yZ05xkBqOBCP8CpzfWBkas8+GiV1H07tv6mi3oyarOfc3hP
 4w7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w5nWdjb90GI2+TAkol2s0H4fVYowwMJxaadOSn6QcUY=;
 b=Kh3I9kScJ3Jx+r2pu7gBO7qz0ufejfSxFHuS65Wzu20Ze/tjwqil8BcX5o1qipWNyv
 Sdcm95nhRDFtjS/XLnoosAcOHUagxUJ3fU0+gmpnNTfBpgbj5rV3+TSO9DpSEtAL/YDv
 ZGf5Nq9Xv7EEbYQLpYoCE/MlgfwqJw64INyofVJ6jGLPFdBVYuyleUzsv3dWPDc80xFh
 5h1ttiiyoApZ8M96xkyv4d9VnNs+QzSiHQUO7r82Ro1Zw5Czz+u3lGKpjV8B+TmEYJLJ
 03YTzU0QxADATViQPKl9AvKmshsMR8YQbf6qFzmHhKruOBkCq2HLf8wfo+Wd74se+Cdd
 dxfg==
X-Gm-Message-State: AOAM533GboOPYcOJxCotq22eePGYv4ASKOMxuDHW0IHWfl9wtTQwmiSj
 sWy/E9mJmYhv12k2HPyc3IWA+w==
X-Google-Smtp-Source: ABdhPJww8GIvcXXddF95MhisGycsLVA2OrrF8dm6FBwFHsH6HeJ8zlz3Bhe5xFrg/og+j4rKvcXOHA==
X-Received: by 2002:a5d:4b04:: with SMTP id v4mr4003474wrq.92.1621512187365;
 Thu, 20 May 2021 05:03:07 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:06 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Thu, 20 May 2021 13:02:25 +0100
Message-Id: <20210520120248.3464013-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 15/38] drm/msm/disp/dpu1/dpu_encoder_phys_cmd:
 Remove unused variable 'cmd_enc'
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXJfcGh5c19jbWQuYzogSW4gZnVuY3Rp
b24g4oCYZHB1X2VuY29kZXJfcGh5c19jbWRfd2FpdF9mb3JfY29tbWl0X2RvbmXigJk6CiBkcml2
ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlcl9waHlzX2NtZC5jOjY4ODozMTog
d2FybmluZzogdmFyaWFibGUg4oCYY21kX2VuY+KAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNl
ZC1idXQtc2V0LXZhcmlhYmxlXQoKQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4K
Q2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVk
QGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogQW5nZWxv
R2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9Ac29tYWlubGlu
ZS5vcmc+CkNjOiBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZwpDYzogZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpT
aWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyX3BoeXNfY21kLmMgfCA0IC0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyX3BoeXNfY21kLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlcl9waHlzX2NtZC5jCmluZGV4IGIyYmUzOWI5MTQ0
ZTQuLjA4ODkwMDg0MWJmOGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9k
cHUxL2RwdV9lbmNvZGVyX3BoeXNfY21kLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNw
L2RwdTEvZHB1X2VuY29kZXJfcGh5c19jbWQuYwpAQCAtNjg1LDEwICs2ODUsNiBAQCBzdGF0aWMg
aW50IGRwdV9lbmNvZGVyX3BoeXNfY21kX3dhaXRfZm9yX3R4X2NvbXBsZXRlKAogc3RhdGljIGlu
dCBkcHVfZW5jb2Rlcl9waHlzX2NtZF93YWl0X2Zvcl9jb21taXRfZG9uZSgKIAkJc3RydWN0IGRw
dV9lbmNvZGVyX3BoeXMgKnBoeXNfZW5jKQogewotCXN0cnVjdCBkcHVfZW5jb2Rlcl9waHlzX2Nt
ZCAqY21kX2VuYzsKLQotCWNtZF9lbmMgPSB0b19kcHVfZW5jb2Rlcl9waHlzX2NtZChwaHlzX2Vu
Yyk7Ci0KIAkvKiBvbmx5IHJlcXVpcmVkIGZvciBtYXN0ZXIgY29udHJvbGxlciAqLwogCWlmICgh
ZHB1X2VuY29kZXJfcGh5c19jbWRfaXNfbWFzdGVyKHBoeXNfZW5jKSkKIAkJcmV0dXJuIDA7Ci0t
IAoyLjMxLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=
