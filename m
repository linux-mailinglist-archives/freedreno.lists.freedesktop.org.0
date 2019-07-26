Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 405DA7645D
	for <lists+freedreno@lfdr.de>; Fri, 26 Jul 2019 13:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2EB06ED21;
	Fri, 26 Jul 2019 11:27:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC196ED22
 for <freedreno@lists.freedesktop.org>; Fri, 26 Jul 2019 11:27:52 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id z15so32569776lfh.13
 for <freedreno@lists.freedesktop.org>; Fri, 26 Jul 2019 04:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dQH4GnL/y7NNHvqjapmVG2NpS/ejAHj8nLLRQ4EYloU=;
 b=ZhwmJOtztJJF08Lv5m9e0yGzm353CGnCbBzeZGJiR+adUoTUkwF1jNaoRqHuB3pfoJ
 n6IoF3WHsDtzbFGqefLNoNkd1b6d/K3fJjRWy62/3JRoLHkOVjI7cqHsAReEd8qHljMF
 xqksAT5819y2NwsQo6CqTsXG5rDIHSLSfQfWyHTQ9PZ1yPF0K71fwDZ+23phgkgSoMo8
 5LfISD6BGBXCY/DLbuJOrR3ykiF28pSxjuR2IW632R2u+g4Hupe/uSwx7y+2ot0Z0zlk
 rLtNSeqHrIUQuZB+UcHrE+BFLnIjf5f9eHQ9Wb2s2bSMTIWxdQM/1Ef34EZNS2BRdLga
 l1Rw==
X-Gm-Message-State: APjAAAVhHkl/2ME4ZwPMnZfT9RFJ5UlUAoke59hgPzAhKNEIztlFWr1S
 OC5jfIwWqRlMN9Tb/QOb5A0/6pIVetvQ0g==
X-Google-Smtp-Source: APXvYqwK6JAGM/+6Ct9HQ9Y4iUiOBdPg34aJqKTvDsITvAa2v2OhVhvNW4jYAPzRSo/1lIt0KkIM0Q==
X-Received: by 2002:ac2:59c9:: with SMTP id x9mr41706584lfn.52.1564140470939; 
 Fri, 26 Jul 2019 04:27:50 -0700 (PDT)
Received: from localhost (c-243c70d5.07-21-73746f28.bbcust.telenor.se.
 [213.112.60.36])
 by smtp.gmail.com with ESMTPSA id m17sm8218208lfj.22.2019.07.26.04.27.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 04:27:50 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Date: Fri, 26 Jul 2019 13:27:46 +0200
Message-Id: <20190726112746.19410-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dQH4GnL/y7NNHvqjapmVG2NpS/ejAHj8nLLRQ4EYloU=;
 b=MeM/PtQCEY3Pof5+eaMTAWxOiKj2b/a9tQSd91Y3IuzC6dgUIHxOagN/qoHqAHA2rs
 Jkr2mriESm2QVd3Bx/UMF4Qut41yjn7Vn3M4jDMaSnxQlZOfx+P0EOR0E5piucx7sbw+
 AGAtaFLkRXdpa4uKjDiXEQZZtdqBMD1XnDbZfF4aflyRQsHFJ/lNAq0WE5+jKUY7Iuyi
 xKzL5883lT5fmNnJkIpB+OrR1rJg/xzD+lJGlw62fRf5G2FpiEQxZyzt7sj7IQg87xDp
 X8YA9i+Gmtmy87qydkMAz5VMETa5mpEiMWaKMBmoHYggHLm8A92JgRnRNdCTkyGqAsH0
 9DRw==
Subject: [Freedreno] [PATCH 1/3] drm: msm: a6xx: Mark expected switch
 fall-through
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
Cc: linux-arm-msm@vger.kernel.org, Anders Roxell <anders.roxell@linaro.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

V2hlbiBmYWxsLXRocm91Z2ggd2FybmluZ3Mgd2FzIGVuYWJsZWQgYnkgZGVmYXVsdCB0aGUgZm9s
bG93aW5nIHdhcm5pbmcKd2FzIHN0YXJ0aW5nIHRvIHNob3cgdXA6CgouLi9kcml2ZXJzL2dwdS9k
cm0vbXNtL2FkcmVuby9hNnh4X2dwdS5jOiBJbiBmdW5jdGlvbiDigJhhNnh4X3N1Ym1pdOKAmToK
Li4vZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHUuYzoxMTY6Nzogd2FybmluZzog
dGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwKIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9
XQogICAgaWYgKHByaXYtPmxhc3RjdHggPT0gY3R4KQogICAgICAgXgouLi9kcml2ZXJzL2dwdS9k
cm0vbXNtL2FkcmVuby9hNnh4X2dwdS5jOjExODozOiBub3RlOiBoZXJlCiAgIGNhc2UgTVNNX1NV
Qk1JVF9DTURfQlVGOgogICBefn5+CgpSZXdvcmsgc28gdGhhdCB0aGUgY29tcGlsZXIgZG9lc24n
dCB3YXJuIGFib3V0IGZhbGwtdGhyb3VnaC4KCkZpeGVzOiBkOTM1MTJlZjBmMGUgKCJNYWtlZmls
ZTogR2xvYmFsbHkgZW5hYmxlIGZhbGwtdGhyb3VnaCB3YXJuaW5nIikKU2lnbmVkLW9mZi1ieTog
QW5kZXJzIFJveGVsbCA8YW5kZXJzLnJveGVsbEBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdS5jCmluZGV4IGJlMzljZjAx
ZTUxZS4uNjQ0YTZlZTUzZjA1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVu
by9hNnh4X2dwdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmMK
QEAgLTExNSw2ICsxMTUsNyBAQCBzdGF0aWMgdm9pZCBhNnh4X3N1Ym1pdChzdHJ1Y3QgbXNtX2dw
dSAqZ3B1LCBzdHJ1Y3QgbXNtX2dlbV9zdWJtaXQgKnN1Ym1pdCwKIAkJY2FzZSBNU01fU1VCTUlU
X0NNRF9DVFhfUkVTVE9SRV9CVUY6CiAJCQlpZiAocHJpdi0+bGFzdGN0eCA9PSBjdHgpCiAJCQkJ
YnJlYWs7CisJCQkvKiBGYWxsIHRocm91Z2ggKi8KIAkJY2FzZSBNU01fU1VCTUlUX0NNRF9CVUY6
CiAJCQlPVVRfUEtUNyhyaW5nLCBDUF9JTkRJUkVDVF9CVUZGRVJfUEZFLCAzKTsKIAkJCU9VVF9S
SU5HKHJpbmcsIGxvd2VyXzMyX2JpdHMoc3VibWl0LT5jbWRbaV0uaW92YSkpOwotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJl
bm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=
