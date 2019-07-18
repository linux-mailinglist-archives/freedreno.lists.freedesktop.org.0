Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CA66D573
	for <lists+freedreno@lfdr.de>; Thu, 18 Jul 2019 21:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3506E464;
	Thu, 18 Jul 2019 19:51:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F8B6E464
 for <freedreno@lists.freedesktop.org>; Thu, 18 Jul 2019 19:51:55 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id f25so13345668pgv.10
 for <freedreno@lists.freedesktop.org>; Thu, 18 Jul 2019 12:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version
 :content-transfer-encoding:in-reply-to:references:subject:to:cc:from
 :user-agent:date;
 bh=zfYhBy8rXbE//COaxouGyZdN8XuohHpGRV5GXewnrg0=;
 b=p+f/UhcUDEQhwEdMdABIlsAeqMUwg12L7FmJkkXpZf32KbZ97sOI7rG4i/0o67oNmy
 pa5OPzjz1YvCFBzoQaCKxlds9wYepSYzEXRJ/FaohyNOcD7tVHuihhMqjyvj3QJe+u4L
 3qXJOuE5aJ7jURBzbbPWkpPWCQ6JHsu7C5krf6eizGSKUG63zL0yMoRkbipp0+aE92bU
 a4Auva7jRIGkXDC4Byw+1i/YSp9M5DFtJDgkclFf5QsqEvZZJGPH+PGuGe76gg78lYgD
 cdRMp68bKmpdM26CYQkzPIXjoj49Zc6GqFrnO2waGmY2g4Ve2iArb7LKYvYbPWUhrJZ0
 kEgg==
X-Gm-Message-State: APjAAAVitPAq2F4K4hd9SydNCWOyf9iBs187ZI88bvufCAnDBcly9XG3
 AUVUBHXIO80UR2seGaYyY0qnTg==
X-Google-Smtp-Source: APXvYqzX3YfqRbUFuVRr8VkMWQFTqQ6b7l4FMXcRmJo8G3y5rS4fIdQe2lsE0s0MX+8ly1O9es6xBg==
X-Received: by 2002:a63:205f:: with SMTP id r31mr49503340pgm.159.1563479515402; 
 Thu, 18 Jul 2019 12:51:55 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id y23sm30556546pfo.106.2019.07.18.12.51.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 12:51:54 -0700 (PDT)
Message-ID: <5d30cdda.1c69fb81.de220.1f10@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <20190630124735.27786-1-robdclark@gmail.com>
References: <20190630124735.27786-1-robdclark@gmail.com>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date: Thu, 18 Jul 2019 12:51:53 -0700
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=message-id:mime-version:content-transfer-encoding:in-reply-to
 :references:subject:to:cc:from:user-agent:date;
 bh=zfYhBy8rXbE//COaxouGyZdN8XuohHpGRV5GXewnrg0=;
 b=DKzzyJpgwrlpAymFb04FfC77Rz/8v2x2vMt97Uo5AbdJL5GOULus42XL9FeHmoaRKU
 63iDopVnfj/IHyacy+pTTzrtu2JsX/GIkaMVxiVuO9aQob2DW/xay1dZuqkLoDJlE19X
 clXgrN9nBoB9+m3VTyBOgFl4dyyN77fIsnv98=
Subject: Re: [Freedreno] [PATCH] drm/msm: stop abusing dma_map/unmap for
 cache
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

UXVvdGluZyBSb2IgQ2xhcmsgKDIwMTktMDYtMzAgMDU6NDc6MjIpCj4gRnJvbTogUm9iIENsYXJr
IDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+IAo+IFJlY2VudGx5IHNwbGF0cyBsaWtlIHRoaXMg
c3RhcnRlZCBzaG93aW5nIHVwOgo+IAo+ICAgIFdBUk5JTkc6IENQVTogNCBQSUQ6IDI1MSBhdCBk
cml2ZXJzL2lvbW11L2RtYS1pb21tdS5jOjQ1MSBfX2lvbW11X2RtYV91bm1hcCsweGI4LzB4YzAK
PiAgICBNb2R1bGVzIGxpbmtlZCBpbjogYXRoMTBrX3Nub2MgYXRoMTBrX2NvcmUgZnVzZSBtc20g
YXRoIG1hYzgwMjExIHV2Y3ZpZGVvIGNmZzgwMjExIHZpZGVvYnVmMl92bWFsbG9jIHZpZGVvYnVm
Ml9tZW1vcHMgdmlkZQo+ICAgIENQVTogNCBQSUQ6IDI1MSBDb21tOiBrd29ya2VyL3UxNjo0IFRh
aW50ZWQ6IEcgICAgICAgIFcgICAgICAgICA1LjIuMC1yYzUtbmV4dC0yMDE5MDYxOSsgIzIzMTcK
PiAgICBIYXJkd2FyZSBuYW1lOiBMRU5PVk8gODFKTC9MTlZOQjE2MTIxNiwgQklPUyA5VUNOMjNX
VyhWMS4wNikgMTAvMjUvMjAxOAo+ICAgIFdvcmtxdWV1ZTogbXNtIG1zbV9nZW1fZnJlZV93b3Jr
IFttc21dCj4gICAgcHN0YXRlOiA4MGMwMDAwNSAoTnpjdiBkYWlmICtQQU4gK1VBTykKPiAgICBw
YyA6IF9faW9tbXVfZG1hX3VubWFwKzB4YjgvMHhjMAo+ICAgIGxyIDogX19pb21tdV9kbWFfdW5t
YXArMHg1NC8weGMwCj4gICAgc3AgOiBmZmZmMDAwMDExOWFiY2UwCj4gICAgeDI5OiBmZmZmMDAw
MDExOWFiY2UwIHgyODogMDAwMDAwMDAwMDAwMDAwMAo+ICAgIHgyNzogZmZmZjgwMDFmOTk0NjY0
OCB4MjY6IGZmZmY4MDAxZWMyNzEwNjgKPiAgICB4MjU6IDAwMDAwMDAwMDAwMDAwMDAgeDI0OiBm
ZmZmODAwMWVhMzU4MGE4Cj4gICAgeDIzOiBmZmZmODAwMWY5NWJhMDEwIHgyMjogZmZmZjgwMDE4
ZTgzYmE4OAo+ICAgIHgyMTogZmZmZjgwMDFlNTQ4ZjAwMCB4MjA6IGZmZmZmZmZmZmZmZmYwMDAK
PiAgICB4MTk6IDAwMDAwMDAwMDAwMDEwMDAgeDE4OiAwMDAwMDAwMGMwMDAwMWZlCj4gICAgeDE3
OiAwMDAwMDAwMDAwMDAwMDAwIHgxNjogMDAwMDAwMDAwMDAwMDAwMAo+ICAgIHgxNTogZmZmZjAw
MDAxNWI3MDA2OCB4MTQ6IDAwMDAwMDAwMDAwMDAwMDUKPiAgICB4MTM6IDAwMDMxNDJjYzFiZTE3
NjggeDEyOiAwMDAwMDAwMDAwMDAwMDAxCj4gICAgeDExOiBmZmZmODAwMWY2ZGU5MTAwIHgxMDog
MDAwMDAwMDAwMDAwMDAwOQo+ICAgIHg5IDogZmZmZjAwMDAxNWI3ODAwMCB4OCA6IDAwMDAwMDAw
MDAwMDAwMDAKPiAgICB4NyA6IDAwMDAwMDAwMDAwMDAwMDEgeDYgOiBmZmZmZmZmZmZmZmZmMDAw
Cj4gICAgeDUgOiAwMDAwMDAwMDAwMDAwZmZmIHg0IDogZmZmZjAwMDAxMDY1ZGJjOAo+ICAgIHgz
IDogMDAwMDAwMDAwMDAwMDAwZCB4MiA6IDAwMDAwMDAwMDAwMDEwMDAKPiAgICB4MSA6IGZmZmZm
ZmZmZmZmZmYwMDAgeDAgOiAwMDAwMDAwMDAwMDAwMDAwCj4gICAgQ2FsbCB0cmFjZToKPiAgICAg
X19pb21tdV9kbWFfdW5tYXArMHhiOC8weGMwCj4gICAgIGlvbW11X2RtYV91bm1hcF9zZysweDk4
LzB4YjgKPiAgICAgcHV0X3BhZ2VzKzB4NWMvMHhmMCBbbXNtXQo+ICAgICBtc21fZ2VtX2ZyZWVf
d29yaysweDEwYy8weDE1MCBbbXNtXQo+ICAgICBwcm9jZXNzX29uZV93b3JrKzB4MWUwLzB4MzMw
Cj4gICAgIHdvcmtlcl90aHJlYWQrMHg0MC8weDQzOAo+ICAgICBrdGhyZWFkKzB4MTJjLzB4MTMw
Cj4gICAgIHJldF9mcm9tX2ZvcmsrMHgxMC8weDE4Cj4gICAgLS0tWyBlbmQgdHJhY2UgYWZjMGRj
NWFiODFhMDZiZiBdLS0tCgpUZXN0ZWQtYnk6IFN0ZXBoZW4gQm95ZCA8c3dib3lkQGNocm9taXVt
Lm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZy
ZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==
