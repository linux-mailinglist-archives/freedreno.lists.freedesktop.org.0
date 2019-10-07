Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D15CCCEE04
	for <lists+freedreno@lfdr.de>; Mon,  7 Oct 2019 22:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F95A6E188;
	Mon,  7 Oct 2019 20:51:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05AFE6E188
 for <freedreno@lists.freedesktop.org>; Mon,  7 Oct 2019 20:51:25 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id b128so9441282pfa.1
 for <freedreno@lists.freedesktop.org>; Mon, 07 Oct 2019 13:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6g6bAI8I8EYsK43cwBiTTXy4oB3NYybaiwTag+iFJPA=;
 b=SABNQ/YV+wym8MAzN+Ob0gpCFHSEWJUpff73q04aohn5lMcd36wVMuo1P5aqFf6QQV
 OIjVXRsbmBX1CRmaLHz1Vy/HokOqpFPihvjYpnZT9Hf08c9mn9qsJBMoUZuLN+51KZnw
 iy0b99i4a7XVxqbSHxKrN7AxzLWsae6rUDOFVF+7Y3jOQbUiAdymSBGhzL7eYZqrfpGQ
 1IwF+mGcOlYsTW13+QmHsCXIVK1AcMLXgc5yS1ixsD9bwX2o0Mxx63UZLzZx+Rt8TXtW
 jajZuRbs6mjk5MWMohXpKO1GO20exRDgFuuAs7N6CCT49mpCNd8Kn49P2wRKUInDTGq6
 rb9A==
X-Gm-Message-State: APjAAAX/kfn8i2E70o9cM3TOI40U1gSdWRqDHk3H+YV+NMv3jMTf7WQD
 QNrHf0GKrhl6ycW1b36gf+8=
X-Google-Smtp-Source: APXvYqy3GawUaKDtynbkxOmrvUe78E4CqvoIysRE+NXAUd0BUstCS0iAwnenFUJnuEigjkBPuOqTiw==
X-Received: by 2002:a63:60e:: with SMTP id 14mr5830612pgg.179.1570481484414;
 Mon, 07 Oct 2019 13:51:24 -0700 (PDT)
Received: from localhost ([100.118.89.196])
 by smtp.gmail.com with ESMTPSA id e192sm17789132pfh.83.2019.10.07.13.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 13:51:23 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux-foundation.org
Date: Mon,  7 Oct 2019 13:49:06 -0700
Message-Id: <20191007204906.19571-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <418d8426-f299-1269-2b2e-f86677cf22c2@arm.com>
References: <418d8426-f299-1269-2b2e-f86677cf22c2@arm.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6g6bAI8I8EYsK43cwBiTTXy4oB3NYybaiwTag+iFJPA=;
 b=rC3YTB0+hOcmaDXUspN39GIY0nApX+Rt/+I0TvKqqeA1Xaq9WCzVeeUHweQW7m6Pav
 VjVX19Qmr1nFoSTKu7/G6DQWha2WEgEh9X5NhuHzHKkws8lYbSCkIoU+t0BqIK7KBmpH
 2+6UkWqL088G7ZOhAa5TGMmTTT0fyUdlaVFSiVJuBYLnKPYCcW0VfSzNdZa62BKIpJuB
 qIexWIG7LzL9jmw5euiECych+ZLh6dexPW2I/F09tthZ/k8q3QBZcPsD7+GUiXJsTfr7
 x+74QhULu49un+22fuw0md1lVwbPHpRnJDYtVwgQFbqrXiVVhfXWf3NeOyUNTCGDScua
 NkJg==
Subject: [Freedreno] [PATCH v2] iommu/arm-smmu: fix "hang" when games exit
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
Cc: Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
 freedreno@lists.freedesktop.org, Joerg Roedel <joro@8bytes.org>,
 open list <linux-kernel@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKV2hlbiBnYW1lcywgYnJv
d3Nlciwgb3IgYW55dGhpbmcgdXNpbmcgYSBsb3Qgb2YgR1BVIGJ1ZmZlcnMgZXhpdHMsIHRoZXJl
CmNhbiBiZSBtYW55IGh1bmRyZWRzIG9yIHRob3VzYW5kcyBvZiBidWZmZXJzIHRvIHVubWFwIGFu
ZCBmcmVlLiAgSWYgdGhlCkdQVSBpcyBvdGhlcndpc2Ugc3VzcGVuZGVkLCB0aGlzIGNhbiBjYXVz
ZSBhcm0tc21tdSB0byByZXN1bWUvc3VzcGVuZApmb3IgZWFjaCBidWZmZXIsIHJlc3VsdGluZyA1
LTEwIHNlY29uZHMgd29ydGggb2YgcmVwcm9ncmFtbWluZyB0aGUKY29udGV4dCBiYW5rIChhcm1f
c21tdV93cml0ZV9jb250ZXh0X2JhbmsoKS9hcm1fc21tdV93cml0ZV9zMmNyKCkvZXRjKS4KVG8g
dGhlIHVzZXIgaXQgd291bGQgYXBwZWFyIHRoYXQgdGhlIHN5c3RlbSBqdXN0IGxvY2tlZCB1cC4K
CkEgc2ltcGxlIHNvbHV0aW9uIGlzIHRvIHVzZSBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgp
IGluc3RlYWQsIHNvIHdlCmRvbid0IGltbWVkaWF0ZWx5IHN1c3BlbmQgdGhlIFNNTVUgZGV2aWNl
LgoKU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgotLS0K
djE6IG9yaWdpbmFsCnYyOiB1bmNvbmRpdGlvbmFsbHkgdXNlIGF1dG9zdXNwZW5kLCByYXRoZXIg
dGhhbiBkZWNpZGluZyBiYXNlZCBvbiB3aGF0CiAgICBjb25zdW1lciBkb2VzCgogZHJpdmVycy9p
b21tdS9hcm0tc21tdS5jIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvYXJtLXNtbXUuYyBi
L2RyaXZlcnMvaW9tbXUvYXJtLXNtbXUuYwppbmRleCAzZjFkNTVmYjQzYzQuLmI3YjQxZjUwMDFi
YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9pb21tdS9hcm0tc21tdS5jCisrKyBiL2RyaXZlcnMvaW9t
bXUvYXJtLXNtbXUuYwpAQCAtMjg5LDcgKzI4OSw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IGFybV9z
bW11X3JwbV9nZXQoc3RydWN0IGFybV9zbW11X2RldmljZSAqc21tdSkKIHN0YXRpYyBpbmxpbmUg
dm9pZCBhcm1fc21tdV9ycG1fcHV0KHN0cnVjdCBhcm1fc21tdV9kZXZpY2UgKnNtbXUpCiB7CiAJ
aWYgKHBtX3J1bnRpbWVfZW5hYmxlZChzbW11LT5kZXYpKQotCQlwbV9ydW50aW1lX3B1dChzbW11
LT5kZXYpOworCQlwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChzbW11LT5kZXYpOwogfQogCiBz
dGF0aWMgc3RydWN0IGFybV9zbW11X2RvbWFpbiAqdG9fc21tdV9kb21haW4oc3RydWN0IGlvbW11
X2RvbWFpbiAqZG9tKQpAQCAtMTQ0NSw2ICsxNDQ1LDkgQEAgc3RhdGljIGludCBhcm1fc21tdV9h
dHRhY2hfZGV2KHN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFpbiwgc3RydWN0IGRldmljZSAqZGV2
KQogCS8qIExvb2tzIG9rLCBzbyBhZGQgdGhlIGRldmljZSB0byB0aGUgZG9tYWluICovCiAJcmV0
ID0gYXJtX3NtbXVfZG9tYWluX2FkZF9tYXN0ZXIoc21tdV9kb21haW4sIGZ3c3BlYyk7CiAKKwlw
bV9ydW50aW1lX3NldF9hdXRvc3VzcGVuZF9kZWxheShzbW11LT5kZXYsIDIwKTsKKwlwbV9ydW50
aW1lX3VzZV9hdXRvc3VzcGVuZChzbW11LT5kZXYpOworCiBycG1fcHV0OgogCWFybV9zbW11X3Jw
bV9wdXQoc21tdSk7CiAJcmV0dXJuIHJldDsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVl
ZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v
