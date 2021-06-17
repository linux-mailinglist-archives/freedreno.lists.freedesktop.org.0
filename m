Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CF93AB6EE
	for <lists+freedreno@lfdr.de>; Thu, 17 Jun 2021 17:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911F56E0DB;
	Thu, 17 Jun 2021 15:09:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91E36E0DB
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jun 2021 15:09:23 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id x6so1828593qvx.4
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jun 2021 08:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uJTGcAdupVs9Ugv04FHACXamoJzkCvHB9LUInm949rQ=;
 b=0kwTwa8f3hL8cWbkSabeU4ie2c9poFkRbJwAggFGl/9viq04wZmf6V6XbbKd1TiAnN
 jCXYwWonNLnHSk4ogPtzJpv/SkyQOz9+jlMxA0jXywR3iIFgFUTH+dvFrnDJkQnSZJcB
 6WnI5/68gIlAVUn/yb4Dih1Nsp9TIuYps08ChmTbRaAuXAknAaLXwVeSl6zQXPc3lXgj
 ksQTS8LFPtiSlkkEb6rHbt7q1V8obRSc6xpK6B55Ma0BMqvqakvbu9B7Gq/7fSKZvIun
 KMbI5DWSAyKE5FDiAeI7NttzZCF6KjWOgp7X3zeCgz7HsDUorQ3YkXnXjdho/4uGL/3x
 oc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uJTGcAdupVs9Ugv04FHACXamoJzkCvHB9LUInm949rQ=;
 b=nlaaiL6i7odjXBStOmwKal4GUmChCFD7dGb/KW+2bbq6YZqXos1P/tGFhCyc75mYnr
 JKM3PiRUIkW5iIPQ5x4DgDXDNBE3So8jsLSxUVgqQpBtiye8cBxlczZWcwBqIWg9LmbM
 Zp1LWj47HSnTSh9U35wbho0r+yjCt7fudAC7onSVg0K1iS2hqf8KXlqPu80aI5LSh12y
 UKFncXQk7+nzqBC6mrXDUwJ746DUFw1MVKIt59OaBcxX4IedP01UOwsuFhic1vjxLzAC
 +JNAi3vSHKcJAlCwp1EAaMrlqV+o3r2NFnfSBLnb2UMi26WIMppZQC43gbP1HGIEZhSw
 Ep2Q==
X-Gm-Message-State: AOAM532SZ9UekUJuPO3ukT5w0uPb0kHzGSmQfO6QaJGeJ4LW8wp+Y5zV
 qCfdtd7LMNvYLOjt/jBHJwHeFQ==
X-Google-Smtp-Source: ABdhPJwJejmVo9lW9I1PL6mSnmsN3+f7RnHD762sdEeQaHmkPGliIyoIwmCfZe6dH6xvZmtgm3QnOQ==
X-Received: by 2002:ad4:4772:: with SMTP id d18mr342093qvx.35.1623942562870;
 Thu, 17 Jun 2021 08:09:22 -0700 (PDT)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca.
 [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id h17sm3297933qtk.23.2021.06.17.08.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 08:09:21 -0700 (PDT)
To: rajeevny@codeaurora.org, Rob Herring <robh@kernel.org>, robh+dt@kernel.org
References: <1622468035-8453-1-git-send-email-rajeevny@codeaurora.org>
 <1622468035-8453-2-git-send-email-rajeevny@codeaurora.org>
 <20210601205848.GA1025498@robh.at.kernel.org>
 <ec1bcb4e734b784ab17c4fc558a5fab9@codeaurora.org>
 <27dec6f881a3b8bd5e13ba32990f975b@codeaurora.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <a453734a-ab1f-bf35-9272-0b94c713f05b@marek.ca>
Date: Thu, 17 Jun 2021 11:07:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <27dec6f881a3b8bd5e13ba32990f975b@codeaurora.org>
Content-Language: en-US
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
Cc: freedreno@lists.freedesktop.org, mkrishn@codeaurora.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, abhinavk@codeaurora.org, kalyan_t@codeaurora.org,
 sean@poorly.run
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gNi8xNi8yMSAxOjUwIEFNLCByYWplZXZueUBjb2RlYXVyb3JhLm9yZyB3cm90ZToKPiBPbiAw
My0wNi0yMDIxIDAxOjMyLCByYWplZXZueUBjb2RlYXVyb3JhLm9yZyB3cm90ZToKPj4gT24gMDIt
MDYtMjAyMSAwMjoyOCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4+PiBPbiBNb24sIE1heSAzMSwgMjAy
MSBhdCAwNzowMzo1M1BNICswNTMwLCBSYWplZXYgTmFuZGFuIHdyb3RlOgo+Pgo+Pj4+ICsKPj4+
PiArcHJvcGVydGllczoKPj4+PiArwqAgY29tcGF0aWJsZToKPj4+PiArwqDCoMKgIG9uZU9mOgo+
Pj4+ICvCoMKgwqDCoMKgIC0gY29uc3Q6IHFjb20sZHNpLXBoeS03bm0KPj4+Cj4+PiBXaGVuIHdv
dWxkIG9uZSB1c2UgdGhpcz8KPj4gVGhpcyBpcyBmb3IgU004MjUwLgo+Pgo+Pj4KPj4+PiArwqDC
oMKgwqDCoCAtIGNvbnN0OiBxY29tLGRzaS1waHktN25tLTcyODAKPj4+PiArwqDCoMKgwqDCoCAt
IGNvbnN0OiBxY29tLGRzaS1waHktN25tLTgxNTAKPj4+Cj4+PiBUaGVzZSBkb24ndCBsb29rIGxp
a2UgZnVsbCBTb0MgbmFtZXMgKHNtODE1MD8pIGFuZCBpdCdzCj4+PiA8dmVuZG9yPiw8c29jPi08
YmxvY2s+Lgo+Pgo+PiBUaGFua3MsIFJvYiwgZm9yIHRoZSByZXZpZXcuCj4+Cj4+IEkganVzdCB0
b29rIHRoZSBgY29tcGF0aWJsZWAgcHJvcGVydHkgY3VycmVudGx5IHVzZWQgaW4gdGhlIERTSSBQ
SFkgCj4+IGRyaXZlcgo+PiAoZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHkuYyks
IGFuZCBhZGRlZCBhIG5ldyBlbnRyeSBmb3IgCj4+IHNjNzI4MC4KPj4gQSBzaW1pbGFyIHBhdHRl
cm4gb2YgYGNvbXBhdGlibGVgIG5hbWVzIGFyZSB1c2VkIGluIG90aGVyIHZhcmlhbnRzIG9mIHRo
ZQo+PiBEU0kgUEhZIGRyaXZlciBlLmcuIHFjb20scWNvbSxkc2ktcGh5LTEwbm0tODk5OCwgcWNv
bSxkc2ktcGh5LTE0bm0tNjYwIAo+PiBldGMuCj4+Cj4+IFRoZSBleGlzdGluZyBjb21wYXRpYmxl
IG5hbWVzICJxY29tLGRzaS1waHktN25tLTgxNTAiIChTb0MgYXQgdGhlIGVuZCkgCj4+IG1ha2UK
Pj4gc29tZSBzZW5zZSwgaWYgd2UgbG9vayBhdCB0aGUgb3JnYW5pemF0aW9uIG9mIHRoZSBkc2kg
cGh5IGRyaXZlciBjb2RlLgo+PiBJIGFtIG5ldyB0byB0aGlzIGFuZCBkb24ndCBrbm93IHRoZSBy
ZWFzb24gYmVoaW5kIHRoZSBjdXJyZW50IGNvZGUKPj4gb3JnYW5pemF0aW9uIGFuZCB0aGlzIG5h
bWluZy4KPj4KPj4gWWVzLCBJIGFncmVlIHdpdGggeW91LCB3ZSBzaG91bGQgdXNlIGZ1bGwgU29D
IG5hbWVzLiBBZGRpbmcKPj4gdGhlIFNvQyBuYW1lIGF0IHRoZSBlbmQgZG9lcyBub3QgZmVlbCB2
ZXJ5IGNvbnZpbmNpbmcsIHNvIEkgd2lsbCAKPj4gY2hhbmdlIHRoaXMKPj4gdG8gdGhlIHN1Z2dl
c3RlZCBmb3JtYXQgZS5nLiAicWNvbSxzbTgyNTAtZHNpLXBoeS03bm0iLCBhbmQgd2lsbCAKPj4g
cmVuYW1lIHRoZQo+PiBvY2N1cnJlbmNlcyBpbiB0aGUgZHJpdmVyIGFuZCBkZXZpY2UgdHJlZSBh
Y2NvcmRpbmdseS4KPj4gRG8gSSBuZWVkIHRvIG1ha2UgY2hhbmdlcyBmb3IgMTBubSwgMTRubSwg
MjBubSwgYW5kIDI4bm0gRFNJIFBIWSB0b28/Cj4+IEJpbmRpbmdzIGRvYyBmb3IgdGhlc2UgUEhZ
cyByZWNlbnRseSBnb3QgbWVyZ2VkIHRvIG1zbS1uZXh0IFsxXQo+Pgo+Pgo+PiBbMV0KPj4gaHR0
cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9tc20vLS9jb21taXQvOGZjOTM5ZTcyZmY4
MDExNmMwOTBhYWYwMzk1MjI1M2ExMjRkMmE4ZSAKPj4KPj4KPiAKPiBIaSBSb2IsCj4gCj4gSSBt
aXNzZWQgYWRkaW5nICJyb2JoK2R0QGtlcm5lbC5vcmciIGVhcmxpZXIgaW4gdGhpcyB0aHJlYWQu
Cj4gCj4gUGxlYXNlIGNoZWNrIG15IHJlc3BvbnNlIHRvIHlvdXIgcmV2aWV3IGNvbW1lbnRzLiBS
ZWdhcmRpbmcgeW91ciAKPiBzdWdnZXN0aW9uIHRvIHVzZSA8dmVuZG9yPiw8c29jPi08YmxvY2s+
IGZvcm1hdCBmb3IgY29tcGF0aWJsZSBwcm9wZXJ0eSwgCj4gc2hvdWxkIEkgYWxzbyB1cGxvYWQg
YSBuZXcgcGF0Y2ggdG8gbWFrZSBjaGFuZ2VzIGluIDEwbm0sIDE0bm0sIDIwbm0sIAo+IGFuZCAy
OG5tIERTSSBQSFkgRFQgYmluZGluZ3M/Cj4gCj4gVGhhbmtzLAo+IFJhamVldgo+IAoKSGksCgpJ
IG1pc3NlZCB0aGlzIGFuZCBlbmRlZCB1cCBzZW5kaW5nIGEgc2ltaWxhciBwYXRjaCBhIHdlZWsg
bGF0ZXIgKGFzIHBhcnQgCm9mIG15IGNwaHkgc2VyaWVzLCBiZWNhdXNlIEkgbmVlZGVkIGl0IHRv
IGFkZCBhICJwaHktdHlwZSIgcHJvcGVydHkpLgoKInFjb20sZHNpLXBoeS03bm0iIGFuZCAicWNv
bSxkc2ktcGh5LTdubS04MTUwIiBhcmVuJ3QgbmV3IGNvbXBhdGlibGVzLCAKdGhleSB3ZXJlIHBy
ZXZpb3VzbHkgZG9jdW1lbnRlZCBpbiB0aGUgLnR4dCBiaW5kaW5ncywgd2hpY2ggYXJlIGdldHRp
bmcgCnJlbW92ZWQsIGJ1dCB0aGUgbmV3IC55YW1sIGJpbmRpbmdzIGRpZG4ndCBpbmNsdWRlIHRo
ZW0uIERvY3VtZW50aW5nIAp0aGVtIGlzIGp1c3QgYSBmaXh1cCB0byB0aGF0IHBhdGNoIFsxXSB3
aGljaCBpcyBhbHJlYWR5IFItQidkIGJ5IFJvYkggCihhbmQgaGFzIHNpbWlsYXIgY29tcGF0aWJs
ZXMgc3VjaCBhcyAicWNvbSxkc2ktcGh5LTEwbm0iIGFuZCAKInFjb20sZHNpLXBoeS0xMG5tLTg5
OTgKIikuCgpZb3UgY2FuIHVzZSBhIGRpZmZlcmVudC9iZXR0ZXIgbmFtaW5nIHNjaGVtZSBmb3Ig
c2M3MjgwLCBidXQgY2hhbmdpbmcgCnRoZSBvdGhlcnMgaGFzIG5vdGhpbmcgdG8gZG8gd2l0aCBh
ZGRpbmcgc3VwcG9ydCBmb3Igc2M3MjgwLgoKWzFdIApodHRwczovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvZHJtL21zbS8tL2NvbW1pdC84ZmM5MzllNzJmZjgwMTE2YzA5MGFhZjAzOTUyMjUzYTEy
NGQyYThlIAoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v
Cg==
