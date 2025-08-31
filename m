Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD322B40061
	for <lists+freedreno@lfdr.de>; Tue,  2 Sep 2025 14:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FD710E69B;
	Tue,  2 Sep 2025 12:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="EtoJRWCA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BE710E364
 for <freedreno@lists.freedesktop.org>; Sun, 31 Aug 2025 19:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1756668571; x=1756927771;
 bh=3KhoKyj0wJd216J+Iova6btrypiDJ3EhDLVcsGVnSak=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=EtoJRWCAvBl9JvPT6u5SYvyp6edJVqRBihXIIT3JCJxX6hL+007Yiie46bApVpsMc
 LSOtADRyelXui0DiEZ7UMbWlWCRVAt4u/Ljjw/rslmCd5akGyPqqQzQqSWm0QfOeV8
 pfmPCYY+TtRsDuzaWnRMPwH829vZ3hxkUN4dB2APZ4e1YFCSPR8FU/Jyl4rvcz90Fc
 so/5Lv9xML10DD54G0RLh1K3T3ypW+5Bt+BLz3iA6yaRUTg3mcLaTsVokNm7OeoL6n
 nqyqIasb2Nk/pS55mVaFE3aGCz1o4Qnktt5sq16FhOvJ2kWV4jbmULT+DyOoxue9UO
 tI/svyhmHEtCQ==
Date: Sun, 31 Aug 2025 19:29:28 +0000
To: "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
From: Ahmed.mekkakia@proton.me
Subject: Adding support to Adreno 1xx GPUs
Message-ID: <_nEiLyt_fbZ0CN7Q0eY38EYzdVG7p41pdKvQpy31wVnPk-814QJ7jzhAksv3pxJ8FUCatjOnP_klgyHGY2r1wTn-a4rjN2AOKR3LsP4bhWk=@proton.me>
Feedback-ID: 131470055:user:proton
X-Pm-Message-ID: da5f61b57576b4a6e17ac89bfd047d5b545a5a0d
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1=_HIoe9leRYZTq0fNTXqkyo8VAw6nZuXTLkmkfsFhA4"
X-Mailman-Approved-At: Tue, 02 Sep 2025 12:26:35 +0000
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

--b1=_HIoe9leRYZTq0fNTXqkyo8VAw6nZuXTLkmkfsFhA4
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGVsbG8sCkkgYW0gd29ya2luZyBvbiBtYWtpbmcgbGludXggZm9yIHRoZSBYcGVyaWEgWDEgKEhU
QyBLb3Zza3kpIGEgdGhpbmcgLCBwcm9ibGVtIGlzIEkgaGF2ZSBpbXBsZW1lbnRlZCBhIGZldyBk
cml2ZXJzIGV4Y2VwdCBmb3IgZ3JhcGhpY3MgYXMgdGhleSBhcmUgdW5kb2N1bWVudGVkIGFuZCB0
aGUgYW5kcm9pZCBkcml2ZXJzIGFyZSBoYXJkIHRvIGZpZ3VyZSBvdXQgd2l0aCBkZWNvbXBpbGlu
ZywgYW5kIHNpbmNlIHlvdXIgcHJvamVjdCBpcyBmb3IgYWRyZW5vIGdyYXBoaWNzIG9uIGxpbnV4
LCBpIHdvdWxkIGxpa2UgdG8ga25vdyBpZiBpdCB3YXMgZXZlciBhdHRlbXB0ZWQsIG9yIGlmIHlv
dSBwbGFuIGl0LCBpZiBuZWl0aGVyLCBkbyB5b3Ugc29tZWhvdyBvd24gYW55IGRvY3VtZW50YXRp
b24gZm9yIHRoZSBhZHJlbm8gMXh4IChtb3JlIHNwZWNpZmljYWxseSAxMzApIGdyYXBoaWNzPwpU
aGFuayB5b3Uu

--b1=_HIoe9leRYZTq0fNTXqkyo8VAw6nZuXTLkmkfsFhA4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdj5IZWxsbywmbmJzcDs8YnI+PC9kaXY+PGRpdj5JIGFtIHdvcmtpbmcgb24gbWFraW5nIGxp
bnV4IGZvciB0aGUgWHBlcmlhIFgxIChIVEMgS292c2t5KSBhIHRoaW5nICwgcHJvYmxlbSBpcyBJ
IGhhdmUgaW1wbGVtZW50ZWQgYSBmZXcgZHJpdmVycyBleGNlcHQgZm9yIGdyYXBoaWNzIGFzIHRo
ZXkgYXJlIHVuZG9jdW1lbnRlZCBhbmQgdGhlIGFuZHJvaWQgZHJpdmVycyBhcmUgaGFyZCB0byBm
aWd1cmUgb3V0IHdpdGggZGVjb21waWxpbmcsIGFuZCBzaW5jZSB5b3VyIHByb2plY3QgaXMgZm9y
IGFkcmVubyBncmFwaGljcyBvbiBsaW51eCwgaSB3b3VsZCBsaWtlIHRvIGtub3cgaWYgaXQgd2Fz
IGV2ZXIgYXR0ZW1wdGVkLCBvciBpZiB5b3UgcGxhbiBpdCwgaWYgbmVpdGhlciwgZG8geW91IHNv
bWVob3cgb3duIGFueSBkb2N1bWVudGF0aW9uIGZvciB0aGUgYWRyZW5vIDF4eCAobW9yZSBzcGVj
aWZpY2FsbHkgMTMwKSBncmFwaGljcz88YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6
IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0cHg7IGNvbG9yOiByZ2IoMCwgMCwgMCk7
IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTUsIDI1NSwgMjU1KTsiPlRoYW5rIHlvdS48L2Rpdj4=


--b1=_HIoe9leRYZTq0fNTXqkyo8VAw6nZuXTLkmkfsFhA4--

