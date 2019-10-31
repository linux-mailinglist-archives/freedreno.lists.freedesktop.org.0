Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F91DEB8F6
	for <lists+freedreno@lfdr.de>; Thu, 31 Oct 2019 22:33:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9746F660;
	Thu, 31 Oct 2019 21:33:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE2C6F660
 for <freedreno@lists.freedesktop.org>; Thu, 31 Oct 2019 21:33:24 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id j12so1353954plt.9
 for <freedreno@lists.freedesktop.org>; Thu, 31 Oct 2019 14:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IVsbwFP8AeKgn5KuqXlWOVRdSf7M1xugTS7jUvEVQtc=;
 b=g+a4nEla/3jyX3PUmv6DBtB1AHoI6ri3PW6zmfvEMIAkXFazXDg8hazrlpKXZrgcMt
 uTFoqWQqkAcXYhNAWidAL+bDBf2GCN9yf6DWBZUrx1+swZx3+KRCh81XVfOcFw41BFOp
 nkmwlxR+hQMQgBwFtvHwM3+0MuTvj6ZrCkdakfid9g8UTyKAeonqruIJOYVHu/fFEfKW
 0T4hfP9SI3/bQ198yI3G9DHEk7rpE1waEZI1w8YmvfJVIP6ZoQPI6m0PsSOFPXQSx1X+
 zF58kywsrGZ2uCrgG60oZPDemF5yXHdwJBsixo/QOoHYNGOb4u8it4bePsGnIClYkWQS
 x31g==
X-Gm-Message-State: APjAAAVYsgjaxPoRkNfI8qEkYzsvNMU3H9kejXZHnlSwmrxAKGBosvvU
 KB+5cshpE3TkjjaOPy5V1OA=
X-Google-Smtp-Source: APXvYqzA8b8TES3q8RMzhJpNbYR+VN+AMBJwUdINXVcCiKsaNB6N/jCmLAzvR9lFLICCokguWu+7lg==
X-Received: by 2002:a17:902:bb84:: with SMTP id
 m4mr8839423pls.211.1572557603878; 
 Thu, 31 Oct 2019 14:33:23 -0700 (PDT)
Received: from localhost ([100.118.89.196])
 by smtp.gmail.com with ESMTPSA id 135sm4038808pgh.89.2019.10.31.14.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2019 14:33:22 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux-foundation.org
Date: Thu, 31 Oct 2019 14:31:02 -0700
Message-Id: <20191031213102.17108-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IVsbwFP8AeKgn5KuqXlWOVRdSf7M1xugTS7jUvEVQtc=;
 b=oU/f2dvCHCBjQ55JB95SZcIANhYyJ9ITAqAZyUPy+8WCm30d3ew7K9ot3ljlismeG0
 64ZZ6rY+w87JZZP2/a/NOpuKpPQSzTOlD6tYFFErCKbk2o/d38myrMyLZHkj0eGMRWrK
 ZO4/0jwX0Y6hEQ1RTWCi/Wj/qeV6Wo9aIp8ZOQwP8c7XCPdeYxXsyETJzw4XyKMBU/lz
 qM9LlLfdRcPdbBy3/9gWJq9L5Nx5jDZR2yKoRwucfTLbyKtZ15BBcdJfb9rJadDqa8HN
 cFg/4VEnXCe2aLl7T7z7Yxd+De1QrhbV0OXFW9p/LS6zk0ELprOQr2XP2R2mafFphhso
 jwwg==
Subject: [Freedreno] [PATCH] iommu/arm-smmu: avoid pathological RPM
 behaviour for unmaps
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
 open list <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>,
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
IGRyaXZlcnMvaW9tbXUvYXJtLXNtbXUuYyB8IDE2ICsrKysrKysrKysrKysrKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9pb21tdS9hcm0tc21tdS5jIGIvZHJpdmVycy9pb21tdS9hcm0tc21tdS5jCmluZGV4IDdj
NTAzYTZiYzU4NS4uNWFiYzBkMjEwZDkwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lvbW11L2FybS1z
bW11LmMKKysrIGIvZHJpdmVycy9pb21tdS9hcm0tc21tdS5jCkBAIC0xMjIsNyArMTIyLDcgQEAg
c3RhdGljIGlubGluZSBpbnQgYXJtX3NtbXVfcnBtX2dldChzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNl
ICpzbW11KQogc3RhdGljIGlubGluZSB2b2lkIGFybV9zbW11X3JwbV9wdXQoc3RydWN0IGFybV9z
bW11X2RldmljZSAqc21tdSkKIHsKIAlpZiAocG1fcnVudGltZV9lbmFibGVkKHNtbXUtPmRldikp
Ci0JCXBtX3J1bnRpbWVfcHV0KHNtbXUtPmRldik7CisJCXBtX3J1bnRpbWVfcHV0X2F1dG9zdXNw
ZW5kKHNtbXUtPmRldik7CiB9CiAKIHN0YXRpYyBzdHJ1Y3QgYXJtX3NtbXVfZG9tYWluICp0b19z
bW11X2RvbWFpbihzdHJ1Y3QgaW9tbXVfZG9tYWluICpkb20pCkBAIC0xMTU0LDYgKzExNTQsMjAg
QEAgc3RhdGljIGludCBhcm1fc21tdV9hdHRhY2hfZGV2KHN0cnVjdCBpb21tdV9kb21haW4gKmRv
bWFpbiwgc3RydWN0IGRldmljZSAqZGV2KQogCS8qIExvb2tzIG9rLCBzbyBhZGQgdGhlIGRldmlj
ZSB0byB0aGUgZG9tYWluICovCiAJcmV0ID0gYXJtX3NtbXVfZG9tYWluX2FkZF9tYXN0ZXIoc21t
dV9kb21haW4sIGZ3c3BlYyk7CiAKKwkvKgorCSAqIFNldHVwIGFuIGF1dG9zdXNwZW5kIGRlbGF5
IHRvIGF2b2lkIGJvdW5jaW5nIHJ1bnBtIHN0YXRlLgorCSAqIE90aGVyd2lzZSwgaWYgYSBkcml2
ZXIgZm9yIGEgc3VzcGVuZGVuZCBjb25zdW1lciBkZXZpY2UKKwkgKiB1bm1hcHMgYnVmZmVycywg
aXQgd2lsbCBydW5wbSByZXN1bWUvc3VzcGVuZCBmb3IgZWFjaCBvbmUuCisJICoKKwkgKiBGb3Ig
ZXhhbXBsZSwgd2hlbiB1c2VkIGJ5IGEgR1BVIGRldmljZSwgd2hlbiBhbiBhcHBsaWNhdGlvbgor
CSAqIG9yIGdhbWUgZXhpdHMsIGl0IGNhbiB0cmlnZ2VyIHVubWFwcGluZyAxMDBzIG9yIDEwMDBz
IG9mCisJICogYnVmZmVycy4gIFdpdGggYSBydW5wbSBjeWNsZSBmb3IgZWFjaCBidWZmZXIsIHRo
YXQgYWRkcyB1cAorCSAqIHRvIDUtMTBzZWMgd29ydGggb2YgcmVwcm9ncmFtbWluZyB0aGUgY29u
dGV4dCBiYW5rLCB3aGlsZQorCSAqIHRoZSBzeXN0ZW0gYXBwZWFycyB0byBiZSBsb2NrZWQgdXAg
dG8gdGhlIHVzZXIuCisJICovCisJcG1fcnVudGltZV9zZXRfYXV0b3N1c3BlbmRfZGVsYXkoc21t
dS0+ZGV2LCAyMCk7CisJcG1fcnVudGltZV91c2VfYXV0b3N1c3BlbmQoc21tdS0+ZGV2KTsKKwog
cnBtX3B1dDoKIAlhcm1fc21tdV9ycG1fcHV0KHNtbXUpOwogCXJldHVybiByZXQ7Ci0tIAoyLjIx
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVk
cmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==
