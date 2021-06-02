Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC036398CD6
	for <lists+freedreno@lfdr.de>; Wed,  2 Jun 2021 16:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C7789194;
	Wed,  2 Jun 2021 14:33:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3A889123
 for <freedreno@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:20 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id r13so1455140wmq.1
 for <freedreno@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w5nWdjb90GI2+TAkol2s0H4fVYowwMJxaadOSn6QcUY=;
 b=Mvgy55stlZuNX/pokvA4s4eyoSRztkqXdXTq93eU6mE/xvlBmNc8uYDIiGRMyggvQJ
 WFdXndyYicCkt2+CVRKGFMv3tWSYrppRxEGKlJy2MV5Y0BiRj1STB3e0XzkDdtXq179W
 cyZ4rGihQFnmuKwfP3Owt6u6vT6bLHRizWuyCP87fA0RvwKHEXseeUXI3octRriaPato
 uV9sgPOs+T01YQtYa0u5ZQSjCTRgSgZZ0Gfcf9D68E9d0uYEclaTQFgituOGvBDGyBN+
 EHTlUC9jhGzAbnHuQlgLrzOVgyxJFK7vIy6/YzDPSxPBj41ZXvek9/DTXIqyh22B5NxP
 C7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w5nWdjb90GI2+TAkol2s0H4fVYowwMJxaadOSn6QcUY=;
 b=M5w5z9XZhOPKZBxwERcwi9dPmNitN5Aly4FW+QU8Nr/OEIvObFt+UrpTeMIjE9uVXi
 CRIIQrBEmfEFgZsFh9+qNqojh11WFxdY05gqVv1JqsUuFp0ORHp4vku1Fd/i+Qg/V/Hy
 pDWmM/S4V4JfkHjID2EUWJR5EWmcSoWEqO5G5R2JhaKXckK/Pk6npB50FUfPXBXZAAVE
 JhRwIwTpLHfdwUpEQFmWT67BOa4OCJFF/R8ymW7O6A+wYdeLqrTJbw0nrsSrf/lY9cKK
 mjBZ4quac6m8zK5DfKApPV9MlLZRXKchb54fBXe6k9ast/OVOQPMbStnRTZYQin2AF2B
 0Wuw==
X-Gm-Message-State: AOAM533WRCDcNXZB1luiGacx/TI2nt4LCHZ598CqWQ8U6MMcI/qRXhLJ
 Ke/D1lkmDreyheFm4ZrKHBu/TA==
X-Google-Smtp-Source: ABdhPJwTGEyQyNzzbXkQyWal5cJWfFdoQqndQ5+cIRX0cKjf8RHVhiiu/dgMTmXmYfZgRMx5PjqE0A==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr5533686wmh.69.1622644399228;
 Wed, 02 Jun 2021 07:33:19 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:18 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Wed,  2 Jun 2021 15:32:43 +0100
Message-Id: <20210602143300.2330146-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [RESEND 09/26] drm/msm/disp/dpu1/dpu_encoder_phys_cmd:
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
