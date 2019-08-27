Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7485E9F14A
	for <lists+freedreno@lfdr.de>; Tue, 27 Aug 2019 19:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3302089B12;
	Tue, 27 Aug 2019 17:13:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F39289B12
 for <freedreno@lists.freedesktop.org>; Tue, 27 Aug 2019 17:13:44 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id p127so6950003oic.8
 for <freedreno@lists.freedesktop.org>; Tue, 27 Aug 2019 10:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZT59bHFCQxNUysxnKx4v2xMJcoeiALfAwa3rgtRRpmY=;
 b=k/pGzq3jOud01RukWmt/rzeDh5NQa0YOSX/jtwig2U7a2FvTe5bwMioA6Sx4Bkfdjj
 K7im523XHDVyp2rm77RTQpt70j4tejJr1QtpAVmFH+WD8sYGEEO/uIOImMQUsP5jSU8q
 PSOzpiZFLKPE7uUiGdKKtN6Z4865XtkcqGCKQiDKiwglZQr9XCjx3PAIz8SExmbS3RGe
 S03CjRNudqll5O36l0NBANM+3z+1NqhjRy5LN5m+hRRMjh6KKCaCThi2hYHGx7m0zrJg
 ysBxFjVtjU39jCHOTbKharM1hhETp7oaStafDKy5Arc2gNF4z+U9NM79JnK2ELR8Oun8
 GQ6Q==
X-Gm-Message-State: APjAAAX/xw4gK8v3Sd8Ba9pYrkrGe30GpKnI5Om+tR88T/QhDK5JEqNM
 6dhS82i1CuJ03I+PpqTSXg==
X-Google-Smtp-Source: APXvYqxslgK0PstOcKY7gHX+NFLxSs5mbQ5emm9JZKa41JXdGW49/ncn4EIxqEgVRmEBPuRT6rgQSg==
X-Received: by 2002:a54:4092:: with SMTP id i18mr5226801oii.66.1566926023468; 
 Tue, 27 Aug 2019 10:13:43 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f21sm5458620otq.7.2019.08.27.10.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 10:13:42 -0700 (PDT)
Date: Tue, 27 Aug 2019 12:13:42 -0500
From: Rob Herring <robh@kernel.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
Message-ID: <20190827171342.GA29932@bogus>
References: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
 <1566327992-362-3-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1566327992-362-3-git-send-email-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Freedreno] [PATCH 2/7] dt-bindings: arm-smmu: Add Adreno GPU
 variant
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gVHVlLCAyMCBBdWcgMjAxOSAxMzowNjoyNyAtMDYwMCwgSm9yZGFuIENyb3VzZSB3cm90ZToK
PiBBZGQgYSBjb21wYXRpYmxlIHN0cmluZyB0byBpZGVudGlmeSBTTU1VcyB0aGF0IGFyZSBhdHRh
Y2hlZAo+IHRvIEFkcmVubyBHUFUgZGV2aWNlcyB0aGF0IHdpc2ggdG8gc3VwcG9ydCBzcGxpdCBw
YWdldGFibGVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvcmRhbiBDcm91c2UgPGpjcm91c2VAY29k
ZWF1cm9yYS5vcmc+Cj4gLS0tCj4gCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9pb21tdS9hcm0sc21tdS50eHQgfCA3ICsrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKQo+IAoKUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVu
byBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==
