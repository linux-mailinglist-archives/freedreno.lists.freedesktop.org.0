Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE74F330A2C
	for <lists+freedreno@lfdr.de>; Mon,  8 Mar 2021 10:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4B86E841;
	Mon,  8 Mar 2021 09:19:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91BC6E83D
 for <freedreno@lists.freedesktop.org>; Mon,  8 Mar 2021 09:19:37 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id e23so5587057wmh.3
 for <freedreno@lists.freedesktop.org>; Mon, 08 Mar 2021 01:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=hEOGgoBFFfBcRYu8R+ZFzD5oTYtm/qga63LL53Ov/bU=;
 b=evLEsiqayrflm8/aMCMFF1KGm9tCqy5TgmLozN1pf5OV8v3XOrrOZ7dusez6ueByqx
 QbfNJbn3Tb6TelmwrFWDd4WHxalQui+FvvMLcnchyO2FEC0WH66rXpO7Bg5MqXxBzX+Z
 cc9Pr7PgNkEy1bM1xcbTqIIGCmKoaS4GNgx3Ck/1lpofYRw8U2M/EjDO4iJe0z6SkwP7
 NEfv8QFCktFfq07V+8oK+WYbUu5K7JfqkfwOCUZH8ZfaC1XQzqb4v836tecMta/an5NF
 q1zYSc8uWIE/dnLOv0rAgqCp8RZ+/3Pe/2mlOOfPdm/KIfJDoR0E3DqxqFiDR11IYcOx
 uh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hEOGgoBFFfBcRYu8R+ZFzD5oTYtm/qga63LL53Ov/bU=;
 b=OEW7P1T6kohRHGTJvBkBIl6dSim0K1eLDh2xgKWDL5tIb55eQK1P8KMVmkgL1kI63k
 idNUIAnQjf5oSbjogug4R1o7xqXLPu//tq6tpd+xP9Xy4KlQEvitSL4ThGJlIks8oA05
 Zq0yfNNf2ivAbHL06PmfCoh5lgO8BRFlyepHMaaTiR1gPn8+6vKi1pNWGV8X3gxxl+LD
 LmNirfuctkX6UuX8vxylQv3rXVWO5hSfxeUNtX1ThZcu/iK/zjVVKXx33WCSHvII9KGA
 riSgERaM8dDl8WasYYFBUfZnA6UW/d0BA/39V5rSzgn5OZ6nJRTz9iDBc0kRktWsdPoZ
 EH0g==
X-Gm-Message-State: AOAM533gJiq8Ty8KOqYnwWhS8HOI09fXWDz/TxvXbRPTaylAUSICzQXi
 Bf6wN08QGz40BkwP3OHWbcK8HA==
X-Google-Smtp-Source: ABdhPJySpXzmJ3MCPU31zc4PaUGqi7NmkyvQv0pK/pj0WvYnEHQRAY6VwjmHVQ6JfBzbPkybjDafLg==
X-Received: by 2002:a1c:400b:: with SMTP id n11mr20979920wma.167.1615195176468; 
 Mon, 08 Mar 2021 01:19:36 -0800 (PST)
Received: from dell ([91.110.221.130])
 by smtp.gmail.com with ESMTPSA id i11sm17599389wro.53.2021.03.08.01.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 01:19:35 -0800 (PST)
Date: Mon, 8 Mar 2021 09:19:32 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Roland Scheidegger <sroland@vmware.com>
Message-ID: <20210308091932.GB4931@dell>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
 <16d4300e-bf29-1e85-317b-53d257890cb9@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <16d4300e-bf29-1e85-317b-53d257890cb9@vmware.com>
Subject: Re: [Freedreno] [RESEND 00/53] Rid GPU from W=1 warnings
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Qinglang Miao <miaoqinglang@huawei.com>,
 Anthony Koo <Anthony.Koo@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jeremy Kolb <jkolb@brandeis.edu>, amd-gfx@lists.freedesktop.org,
 Rob Clark <rob.clark@linaro.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>, linux-media@vger.kernel.org,
 Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Leo Li <sunpeng.li@amd.com>, linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linaro-mm-sig@lists.linaro.org,
 Sean Paul <sean@poorly.run>, Kuogee Hsieh <khsieh@codeaurora.org>,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, freedreno@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zackr@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gRnJpLCAwNSBNYXIgMjAyMSwgUm9sYW5kIFNjaGVpZGVnZ2VyIHdyb3RlOgoKPiBUaGUgdm13
Z2Z4IG9uZXMgbG9vayBhbGwgZ29vZCB0byBtZSwgc28gZm9yCj4gMjMtNTM6IFJldmlld2VkLWJ5
OiBSb2xhbmQgU2NoZWlkZWdnZXIgPHNyb2xhbmRAdm13YXJlLmNvbT4KPiBUaGF0IHNhaWQsIHRo
ZXkgd2VyZSBhbHJlYWR5IHNpZ25lZCBvZmYgYnkgWmFjaywgc28gbm90IHN1cmUgd2hhdAo+IGhh
cHBlbmVkIGhlcmUuCgpZZXMsIHRoZXkgd2VyZSBhY2NlcHRlZCBhdCBvbmUgcG9pbnQsIHRoZW4g
ZHJvcHBlZCB3aXRob3V0IGEgcmVhc29uLgoKU2luY2UgSSByZWJhc2VkIG9udG8gdGhlIGxhdGVz
dCAtbmV4dCwgSSBoYWQgdG8gcGx1Y2sgdGhlbSBiYWNrIG91dCBvZgphIHByZXZpb3VzIG9uZS4K
Ci0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxv
cGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0g
U29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxp
c3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=
