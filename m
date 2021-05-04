Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B971372E85
	for <lists+freedreno@lfdr.de>; Tue,  4 May 2021 19:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7012B6EB3D;
	Tue,  4 May 2021 17:11:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A9C6EB3C
 for <freedreno@lists.freedesktop.org>; Tue,  4 May 2021 17:11:51 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id r13so4820523qvm.7
 for <freedreno@lists.freedesktop.org>; Tue, 04 May 2021 10:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
 h=from:mime-version:references:in-reply-to:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2FNgXz1eZgIsAhzPOm44KOmzV2GlF9acNuOloClC5MA=;
 b=O4sGtM2Lhor313MIyDbI4nesXV7pQ7pe7Q8Z3a8PLbSmj92CfS5md+vpVGSWd6RrW6
 MT7MfumRVypMVNITPUaTDqV0wr73OT0pLUacP+/lldQFjKCULvetYjxFqnZxpyoxJw2I
 xKaqMo1wq0slQN4Rcd6rW9rhrw3rUwz68/7Gwa7AU7vJaDW3W1KL4kmaFdum/PfR/jet
 NGB/ltnLoGY5fnKHNJxnhZFokhnDirW2vjtj7CkpZapAfyh80ed10dl51OCMS2TomgAE
 UH0ojwEphlXiyojA7infWSQ408oilrR1T0O206Ho/PEFaTdSwua47vHGH0tBA/MVKlbF
 2jvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:references:in-reply-to:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2FNgXz1eZgIsAhzPOm44KOmzV2GlF9acNuOloClC5MA=;
 b=S3YF+QvylG9xBnwETB0kZujm4clXly8RD17Jj9O1bdSkvSWxLGzyUvr2q28YndJroB
 Q+g6E9YQMPNwuY1IZ3VsPYD3dO1otGs1+P6gf8t3eMISzty4AucoJ5B5OPFQ1QZlwg7e
 yFbh5reUAoSaKSRKmo3AYhuEzfV+hZrw/wL8qQpBwEuDgVMKLL4O0JhcdrnKrUoK7oB6
 tlQXPyCmbA/v5d3tTvPCYa4WFVLKiY/Iggf5d5v0qGij6jjpnNyQc4HXEXXgn/iSGAHY
 xmskHvz7UpmedpKF61teIss2jljPvW6ae+Oi6bKjJ7WiYCfs3S0S/KYUBMP8DIGkd30l
 LhjA==
X-Gm-Message-State: AOAM530z+eH52lQjsNv/zo8l7D4A/bk+iMZy/iLl7RNq0XKwakhI6HIT
 zqIv1OESn9Dm7aP3OCLE+heUsaslUZWYbkIo
X-Google-Smtp-Source: ABdhPJwpITr377AilylqzVBgS93l5YXSIgKbLhRQBk/vptLuE10GLjSRr7kLLRE13ygmHEr0lc5JZA==
X-Received: by 2002:a05:6214:a8b:: with SMTP id
 ev11mr19478677qvb.42.1620148311032; 
 Tue, 04 May 2021 10:11:51 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com.
 [209.85.160.174])
 by smtp.gmail.com with ESMTPSA id 4sm2892436qtc.40.2021.05.04.10.11.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 10:11:50 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f174.google.com with SMTP id j19so4003774qtp.7;
 Tue, 04 May 2021 10:11:50 -0700 (PDT)
X-Received: by 2002:a05:622a:3cc:: with SMTP id
 k12mr23838908qtx.233.1620148309949; 
 Tue, 04 May 2021 10:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAP9ODKpQxxnaX5DVSHmq4HJpCOpp_rOPwtOJ=ADRZgg20R6wPg@mail.gmail.com>
 <CAF6AEGuAMA8vMqTZQA=PCXGR781j4xmv-ahT1cQj92bpiMvvqw@mail.gmail.com>
In-Reply-To: <CAF6AEGuAMA8vMqTZQA=PCXGR781j4xmv-ahT1cQj92bpiMvvqw@mail.gmail.com>
Date: Tue, 4 May 2021 14:11:38 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp3Zq29cjVaD_pZM2pfDHBcKXeRcgkZUEKA9fVgG+V3rg@mail.gmail.com>
Message-ID: <CAP9ODKp3Zq29cjVaD_pZM2pfDHBcKXeRcgkZUEKA9fVgG+V3rg@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] i.MX53 error during GPU use
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
Cc: Sean Paul <sean@poorly.run>, vinicius.aquino@ossystems.com.br,
 Fabio Estevam <festevam@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, luan.rafael@ossystems.com.br,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

SGVsbG8gUm9iLAoKRW0gc2V4LiwgMjMgZGUgYWJyLiBkZSAyMDIxIMOgcyAxMTozNSwgUm9iIENs
YXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPiBlc2NyZXZldToKPiBPbiBGcmksIEFwciAyMywgMjAy
MSBhdCA0OjU4IEFNIE90YXZpbyBTYWx2YWRvcgo+IDxvdGF2aW8uc2FsdmFkb3JAb3NzeXN0ZW1z
LmNvbS5icj4gd3JvdGU6Cj4gPiBXZSBmb3VuZCB0aGlzIGVycm9yIHdoZW4gdXNpbmcgRnJlZWRy
ZW5vIGRyaXZlciBvbiBhbiBpLk1YNTMgZGV2aWNlCj4gPiB3aXRoIFdheWxhbmQuIEFueSBpZGVh
IGhvdyB0byBmaXggdGhpcz8KPiA+Cj4gPiBbICAgMzIuNDE0MTEwXSBbZHJtOm1zbV9pb2N0bF9n
ZW1fc3VibWl0XSAqRVJST1IqIGludmFsaWQgY21kc3RyZWFtIHNpemU6IDAKPgo+IFRoZSBpbnZh
bGlkIGNtZHN0cmVhbSBzaXplIGlzIHNvbWUgc29ydCBvZiB1c2Vyc3BhY2UgZXJyb3IKPgo+ID4g
WyAgIDM5LjE3NzA3NV0KPiA+IFsgICAzOS4xNzg2MTddID09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4gWyAgIDM5LjE4NDgwNF0gV0FSTklO
RzogcG9zc2libGUgY2lyY3VsYXIgbG9ja2luZyBkZXBlbmRlbmN5IGRldGVjdGVkCj4gPiBbICAg
MzkuMTkwOTk3XSA1LjEwLjMxK2c3YWUxZGUxZDJiZDMgIzEgTm90IHRhaW50ZWQKPiA+IFsgICAz
OS4xOTU2MTldIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+Cj4gQnV0IHBvc3NpYmx5IGl0IGlzIHRyaWdnZXJpbmcgdGhlIGxvY2tkZXAgYW5n
ZXI/ICBJdCBsb29rcyBsaWtlIHRoZQo+IGdlbSBsb2NraW5nIHJlLXdvcmsgbGFuZGVkIGluIHY1
LjExLi4gYW55IGNoYW5jZSB5b3UgY2FuIHRyeSBhIG5ld2VyCj4ga2VybmVsPwoKU3VyZTsgd2Ug
dHJpZWQgdGhlIDUuMTIuMSBMaW51eCBrZXJuZWwgYW5kIGl0ICJ3b3JrZWQiLiBXZSBoYXZlIHVz
ZWQKZm9sbG93aW5nIHZlcnNpb25zOgoKLSBMaW51eCBrZXJuZWwgNS4xMi4xCi0gbWVzYSAyMS4w
LjMKLSBsaWJkcm0gMi40LjEwNQoKSXQgaW1wcm92ZWQgYSBsb3QgYW5kIGl0IG9wZW5zLiBXZSBu
b3cgaGF2ZSBzb21lIHJlbmRlcmluZyBpc3N1ZXM6CgpodHRwczovL3Bob3Rvcy5hcHAuZ29vLmds
L2ZCS29lNUM4dHNxNHhVNTU2CgphbmQgYW4gZXJyb3IgaW4gc2VyaWFsIGNvbnNvbGU6CgpbICAy
NjIuMzE5ODkwXSBzY2hlZHVsZV90aW1lb3V0OiB3cm9uZyB0aW1lb3V0IHZhbHVlIGJmOTQ2ZjZl
ClsgIDI2Mi4zMjU4NDVdIENQVTogMCBQSUQ6IDIxNiBDb21tOiBlYWRlZENvbXBvc2l0b3IgTm90
IHRhaW50ZWQKNS4xMi4xK2cxYTVmZWExMWJjMmYgIzEKWyAgMjYyLjMzMzcyN10gSGFyZHdhcmUg
bmFtZTogRnJlZXNjYWxlIGkuTVg1MyAoRGV2aWNlIFRyZWUgU3VwcG9ydCkKWyAgMjYyLjMzOTg1
NF0gWzxjMDExMTRlOD5dICh1bndpbmRfYmFja3RyYWNlKSBmcm9tIFs8YzAxMGJiNjA+XQooc2hv
d19zdGFjaysweDEwLzB4MTQpClsgIDI2Mi4zNDc2NTldIFs8YzAxMGJiNjA+XSAoc2hvd19zdGFj
aykgZnJvbSBbPGMwZTQ0NmIwPl0KKGR1bXBfc3RhY2srMHhkYy8weDEwNCkKWyAgMjYyLjM1NTAw
N10gWzxjMGU0NDZiMD5dIChkdW1wX3N0YWNrKSBmcm9tIFs8YzBlNTkyOGM+XQooc2NoZWR1bGVf
dGltZW91dCsweGYwLzB4MTI4KQpbICAyNjIuMzYyODc1XSBbPGMwZTU5MjhjPl0gKHNjaGVkdWxl
X3RpbWVvdXQpIGZyb20gWzxjMDc4OTI2MD5dCihtc21fd2FpdF9mZW5jZSsweDFjMC8weDMyMCkK
WyAgMjYyLjM3MTE5MF0gWzxjMDc4OTI2MD5dIChtc21fd2FpdF9mZW5jZSkgZnJvbSBbPGMwNzg4
NTEwPl0KKG1zbV9pb2N0bF93YWl0X2ZlbmNlKzB4YTgvMHgxNTQpClsgIDI2Mi4zNzk3NDldIFs8
YzA3ODg1MTA+XSAobXNtX2lvY3RsX3dhaXRfZmVuY2UpIGZyb20gWzxjMDcwMDA2ND5dCihkcm1f
aW9jdGwrMHgxZjAvMHgzZGMpClsgIDI2Mi4zODc5NjZdIFs8YzA3MDAwNjQ+XSAoZHJtX2lvY3Rs
KSBmcm9tIFs8YzAyZGU4ZWM+XQooc3lzX2lvY3RsKzB4M2NjLzB4YmFjKQpbICAyNjIuMzk1MjI2
XSBbPGMwMmRlOGVjPl0gKHN5c19pb2N0bCkgZnJvbSBbPGMwMTAwMDgwPl0KKHJldF9mYXN0X3N5
c2NhbGwrMHgwLzB4MmMpClsgIDI2Mi40MDI4MjldIEV4Y2VwdGlvbiBzdGFjaygweGMzMTVmZmE4
IHRvIDB4YzMxNWZmZjApClsgIDI2Mi40MDc5MTFdIGZmYTA6ICAgICAgICAgICAgICAgICAgIDAw
MDAwMDAwIGFiYzEwODQwIDAwMDAwMDEwCjQwMjA2NDQ3IGFiYzEwODQwIDAwMDAwMDIwClsgIDI2
Mi40MTYxMThdIGZmYzA6IDAwMDAwMDAwIGFiYzEwODQwIDQwMjA2NDQ3IDAwMDAwMDM2IGFmZDMy
Y2IwCmFiYzEwOGI4IDAwMDAwMDAwIGFiYzEwODdjClsgIDI2Mi40MjQzMjBdIGZmZTA6IGIwNzVh
ZWYwIGFiYzEwODA0IGIwNzQwMjE0IGI0MGExMWZjCgpBbnkgaWRlYSB3aGF0IG1pZ2h0IGJlIGNh
dXNpbmcgaXQ/CgoKCgotLQpPdGF2aW8gU2FsdmFkb3IgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIE8uUy4gU3lzdGVtcwpodHRwOi8vd3d3Lm9zc3lzdGVtcy5jb20uYnIgICAgICAgIGh0dHA6
Ly9jb2RlLm9zc3lzdGVtcy5jb20uYnIKTW9iaWxlOiArNTUgKDUzKSA5IDk5ODEtNzg1NCAgICAg
ICAgICBNb2JpbGU6ICsxICgzNDcpIDkwMy05NzUwCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2ZyZWVkcmVubwo=
