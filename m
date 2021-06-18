Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DED3AC8F9
	for <lists+freedreno@lfdr.de>; Fri, 18 Jun 2021 12:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDB76E9CF;
	Fri, 18 Jun 2021 10:39:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921036E9CF
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jun 2021 10:39:24 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1624012766; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=4fG1y8WDPrYtBMq9UfTcY0OGD8AEXRPSN4vcguMIVpM=;
 b=O7zkj0drcVt1dJxTo8Sx7HsQPt76yqSXQ4RiPdHyYUIqApNNpgzWyKnPmfHLbTdSvi/kcB/g
 CIcgvt0m5t+3A+i3Y83ucYLtTjAbnll1nphqCVesbxTh3tV3ayoyoHyrRVf/u4LlF4W40+Yg
 vTu5ORQOuPno1qQhjVfy0Ld25UM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60cc77d8e27c0cc77fa0ca10 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Jun 2021 10:39:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8B316C43217; Fri, 18 Jun 2021 10:39:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: rajeevny)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4116CC433D3;
 Fri, 18 Jun 2021 10:39:17 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 18 Jun 2021 16:09:17 +0530
From: rajeevny@codeaurora.org
To: Jonathan Marek <jonathan@marek.ca>
In-Reply-To: <a453734a-ab1f-bf35-9272-0b94c713f05b@marek.ca>
References: <1622468035-8453-1-git-send-email-rajeevny@codeaurora.org>
 <1622468035-8453-2-git-send-email-rajeevny@codeaurora.org>
 <20210601205848.GA1025498@robh.at.kernel.org>
 <ec1bcb4e734b784ab17c4fc558a5fab9@codeaurora.org>
 <27dec6f881a3b8bd5e13ba32990f975b@codeaurora.org>
 <a453734a-ab1f-bf35-9272-0b94c713f05b@marek.ca>
Message-ID: <a736c5e48907bc2da064f98d94dff9da@codeaurora.org>
X-Sender: rajeevny@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [v1 1/3] dt-bindings: msm/dsi: Add yaml schema for
 7nm DSI PHY
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
Cc: sean@poorly.run, Rob Herring <robh@kernel.org>, mkrishn@codeaurora.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, robh+dt@kernel.org, abhinavk@codeaurora.org,
 kalyan_t@codeaurora.org, freedreno@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Ck9uIDE3LTA2LTIwMjEgMjA6MzcsIEpvbmF0aGFuIE1hcmVrIHdyb3RlOgo+IE9uIDYvMTYvMjEg
MTo1MCBBTSwgcmFqZWV2bnlAY29kZWF1cm9yYS5vcmcgd3JvdGU6Cj4+IE9uIDAzLTA2LTIwMjEg
MDE6MzIsIHJhamVldm55QGNvZGVhdXJvcmEub3JnIHdyb3RlOgo+Pj4gT24gMDItMDYtMjAyMSAw
MjoyOCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4+Pj4gT24gTW9uLCBNYXkgMzEsIDIwMjEgYXQgMDc6
MDM6NTNQTSArMDUzMCwgUmFqZWV2IE5hbmRhbiB3cm90ZToKPj4+IAo+Pj4+PiArCj4+Pj4+ICtw
cm9wZXJ0aWVzOgo+Pj4+PiArwqAgY29tcGF0aWJsZToKPj4+Pj4gK8KgwqDCoCBvbmVPZjoKPj4+
Pj4gK8KgwqDCoMKgwqAgLSBjb25zdDogcWNvbSxkc2ktcGh5LTdubQo+Pj4+IAo+Pj4+IFdoZW4g
d291bGQgb25lIHVzZSB0aGlzPwo+Pj4gVGhpcyBpcyBmb3IgU004MjUwLgo+Pj4gCj4+Pj4gCj4+
Pj4+ICvCoMKgwqDCoMKgIC0gY29uc3Q6IHFjb20sZHNpLXBoeS03bm0tNzI4MAo+Pj4+PiArwqDC
oMKgwqDCoCAtIGNvbnN0OiBxY29tLGRzaS1waHktN25tLTgxNTAKPj4+PiAKPj4+PiBUaGVzZSBk
b24ndCBsb29rIGxpa2UgZnVsbCBTb0MgbmFtZXMgKHNtODE1MD8pIGFuZCBpdCdzCj4+Pj4gPHZl
bmRvcj4sPHNvYz4tPGJsb2NrPi4KPj4+IAo+Pj4gVGhhbmtzLCBSb2IsIGZvciB0aGUgcmV2aWV3
Lgo+Pj4gCj4+PiBJIGp1c3QgdG9vayB0aGUgYGNvbXBhdGlibGVgIHByb3BlcnR5IGN1cnJlbnRs
eSB1c2VkIGluIHRoZSBEU0kgUEhZIAo+Pj4gZHJpdmVyCj4+PiAoZHJpdmVycy9ncHUvZHJtL21z
bS9kc2kvcGh5L2RzaV9waHkuYyksIGFuZCBhZGRlZCBhIG5ldyBlbnRyeSBmb3IgCj4+PiBzYzcy
ODAuCj4+PiBBIHNpbWlsYXIgcGF0dGVybiBvZiBgY29tcGF0aWJsZWAgbmFtZXMgYXJlIHVzZWQg
aW4gb3RoZXIgdmFyaWFudHMgb2YgCj4+PiB0aGUKPj4+IERTSSBQSFkgZHJpdmVyIGUuZy4gcWNv
bSxxY29tLGRzaS1waHktMTBubS04OTk4LCAKPj4+IHFjb20sZHNpLXBoeS0xNG5tLTY2MCBldGMu
Cj4+PiAKPj4+IFRoZSBleGlzdGluZyBjb21wYXRpYmxlIG5hbWVzICJxY29tLGRzaS1waHktN25t
LTgxNTAiIChTb0MgYXQgdGhlIAo+Pj4gZW5kKSBtYWtlCj4+PiBzb21lIHNlbnNlLCBpZiB3ZSBs
b29rIGF0IHRoZSBvcmdhbml6YXRpb24gb2YgdGhlIGRzaSBwaHkgZHJpdmVyIAo+Pj4gY29kZS4K
Pj4+IEkgYW0gbmV3IHRvIHRoaXMgYW5kIGRvbid0IGtub3cgdGhlIHJlYXNvbiBiZWhpbmQgdGhl
IGN1cnJlbnQgY29kZQo+Pj4gb3JnYW5pemF0aW9uIGFuZCB0aGlzIG5hbWluZy4KPj4+IAo+Pj4g
WWVzLCBJIGFncmVlIHdpdGggeW91LCB3ZSBzaG91bGQgdXNlIGZ1bGwgU29DIG5hbWVzLiBBZGRp
bmcKPj4+IHRoZSBTb0MgbmFtZSBhdCB0aGUgZW5kIGRvZXMgbm90IGZlZWwgdmVyeSBjb252aW5j
aW5nLCBzbyBJIHdpbGwgCj4+PiBjaGFuZ2UgdGhpcwo+Pj4gdG8gdGhlIHN1Z2dlc3RlZCBmb3Jt
YXQgZS5nLiAicWNvbSxzbTgyNTAtZHNpLXBoeS03bm0iLCBhbmQgd2lsbCAKPj4+IHJlbmFtZSB0
aGUKPj4+IG9jY3VycmVuY2VzIGluIHRoZSBkcml2ZXIgYW5kIGRldmljZSB0cmVlIGFjY29yZGlu
Z2x5Lgo+Pj4gRG8gSSBuZWVkIHRvIG1ha2UgY2hhbmdlcyBmb3IgMTBubSwgMTRubSwgMjBubSwg
YW5kIDI4bm0gRFNJIFBIWSB0b28/Cj4+PiBCaW5kaW5ncyBkb2MgZm9yIHRoZXNlIFBIWXMgcmVj
ZW50bHkgZ290IG1lcmdlZCB0byBtc20tbmV4dCBbMV0KPj4+IAo+Pj4gCj4+PiBbMV0KPj4+IGh0
dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vbXNtLy0vY29tbWl0LzhmYzkzOWU3MmZm
ODAxMTZjMDkwYWFmMDM5NTIyNTNhMTI0ZDJhOGUKPj4gCj4+IEhpIFJvYiwKPj4gCj4+IEkgbWlz
c2VkIGFkZGluZyAicm9iaCtkdEBrZXJuZWwub3JnIiBlYXJsaWVyIGluIHRoaXMgdGhyZWFkLgo+
PiAKPj4gUGxlYXNlIGNoZWNrIG15IHJlc3BvbnNlIHRvIHlvdXIgcmV2aWV3IGNvbW1lbnRzLiBS
ZWdhcmRpbmcgeW91ciAKPj4gc3VnZ2VzdGlvbiB0byB1c2UgPHZlbmRvcj4sPHNvYz4tPGJsb2Nr
PiBmb3JtYXQgZm9yIGNvbXBhdGlibGUgCj4+IHByb3BlcnR5LCBzaG91bGQgSSBhbHNvIHVwbG9h
ZCBhIG5ldyBwYXRjaCB0byBtYWtlIGNoYW5nZXMgaW4gMTBubSwgCj4+IDE0bm0sIDIwbm0sIGFu
ZCAyOG5tIERTSSBQSFkgRFQgYmluZGluZ3M/Cj4+IAo+PiBUaGFua3MsCj4+IFJhamVldgo+PiAK
PiAKPiBIaSwKPiAKPiBJIG1pc3NlZCB0aGlzIGFuZCBlbmRlZCB1cCBzZW5kaW5nIGEgc2ltaWxh
ciBwYXRjaCBhIHdlZWsgbGF0ZXIgKGFzCj4gcGFydCBvZiBteSBjcGh5IHNlcmllcywgYmVjYXVz
ZSBJIG5lZWRlZCBpdCB0byBhZGQgYSAicGh5LXR5cGUiCj4gcHJvcGVydHkpLgo+IAo+ICJxY29t
LGRzaS1waHktN25tIiBhbmQgInFjb20sZHNpLXBoeS03bm0tODE1MCIgYXJlbid0IG5ldyBjb21w
YXRpYmxlcywKPiB0aGV5IHdlcmUgcHJldmlvdXNseSBkb2N1bWVudGVkIGluIHRoZSAudHh0IGJp
bmRpbmdzLCB3aGljaCBhcmUKPiBnZXR0aW5nIHJlbW92ZWQsIGJ1dCB0aGUgbmV3IC55YW1sIGJp
bmRpbmdzIGRpZG4ndCBpbmNsdWRlIHRoZW0uCj4gRG9jdW1lbnRpbmcgdGhlbSBpcyBqdXN0IGEg
Zml4dXAgdG8gdGhhdCBwYXRjaCBbMV0gd2hpY2ggaXMgYWxyZWFkeQo+IFItQidkIGJ5IFJvYkgg
KGFuZCBoYXMgc2ltaWxhciBjb21wYXRpYmxlcyBzdWNoIGFzICJxY29tLGRzaS1waHktMTBubSIK
PiBhbmQgInFjb20sZHNpLXBoeS0xMG5tLTg5OTgKPiAiKS4KPiAKPiBZb3UgY2FuIHVzZSBhIGRp
ZmZlcmVudC9iZXR0ZXIgbmFtaW5nIHNjaGVtZSBmb3Igc2M3MjgwLCBidXQgY2hhbmdpbmcKPiB0
aGUgb3RoZXJzIGhhcyBub3RoaW5nIHRvIGRvIHdpdGggYWRkaW5nIHN1cHBvcnQgZm9yIHNjNzI4
MC4KPiAKPiBbMV0KPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL21zbS8tL2Nv
bW1pdC84ZmM5MzllNzJmZjgwMTE2YzA5MGFhZjAzOTUyMjUzYTEyNGQyYThlCgpIaSBKb25hdGhh
biwKCkkgd2lsbCBkaXNjYXJkIHRoaXMgcGF0Y2ggYW5kIHdpbGwgYWRkIHRoZSBiaW5kaW5ncyBm
b3IgdGhlIHNjNzI4MCBvbiAKdG9wIG9mIHlvdXIgcGF0Y2ggWzFdLgoKWzFdIApodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1hcm0tbXNtLzIwMjEwNjE3MTQ0MzQ5LjI4NDQ4LTItam9uYXRo
YW5AbWFyZWsuY2EvCgoKVGhhbmtzLApSYWplZXYKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZnJlZWRyZW5vCg==
