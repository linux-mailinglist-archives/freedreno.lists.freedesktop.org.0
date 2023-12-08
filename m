Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C8C809867
	for <lists+freedreno@lfdr.de>; Fri,  8 Dec 2023 02:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4287E10E249;
	Fri,  8 Dec 2023 01:11:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DB010E9C8
 for <freedreno@lists.freedesktop.org>; Fri,  8 Dec 2023 01:11:06 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c9f4bb2e5eso20683011fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 07 Dec 2023 17:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701997864; x=1702602664; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cPIpR2OhS8FsOJYuELc4EcfXoYVEFO3KDU00U/AniAY=;
 b=Gf7X5e74P8tlns0Kv9eLwuR2MrXW2BhP1zh++SaAKOSf37PB2Rjn+9ILohQW9OfT2+
 O47LBRADOesRsmPJicArS9K1N6nH48Bb55b/YviUXGJdKOGvlbo/eItBsZWMOx9i7eRR
 Tbdbbv7ijJZr4Zkv6ac4/BZCAPIaRq41cGxfx5hTCc0RD3GFzGBl6L65TpvchCkMyBdl
 s5Y9KTs3k6d8XYSJOWxvO99rNl4Gw4hWVTCMUIEqcGDIyME1RQ/Qu3vSkHWGcb9sXFHp
 ij0M/kwMu/dfiYhYjy/7CSV3ZMDgLIaXjdg/ZkXhNOrj7X9ClHco3YbjIqWPFQrRezNn
 TlKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701997864; x=1702602664;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cPIpR2OhS8FsOJYuELc4EcfXoYVEFO3KDU00U/AniAY=;
 b=A+ntiJR0RbSBAtEqb4MwpSb/m/qmEKj9UDoeI0MpvFOmGTXPnLDOY04KXGq5r0H3E7
 Qx0/X3FHSyya7RKh/pGniSB+K4aHy9jHq87LlPIlkF79Hd7H9VQgtyzUUYYcENxiwMRa
 SrlqV7gG9qmoHsdaKaq6Q9STSN7ZU4Hd6jySipLsTb2yUSsLHflIoHQRTW0x0ZMj9W7i
 1FNyJfVAMAFzghGdpUb+tyqR3/AVklFNMIWWbsuTvrK9SvVROjKxgYFMhkPSokzhBw/Q
 Srq+K7bwJ4t+/Zj1ENBidzauvN86DLdgQlutE1PtYlEGuLroJ5lVU+1fuMxH22i1aBTK
 jwGg==
X-Gm-Message-State: AOJu0YyQLrwS725/9igR1//IHyQ7Gb9q+eXF4YzvrazTfPvke32OoD2T
 ujVWLii87VrcZLogZP8l3jTA/w==
X-Google-Smtp-Source: AGHT+IEWZjda2fsJ0zD6R8OaPvGCIhuiY+08NdpNxfUAkKx96xvmVTnzBUfNL5Fr1v/oeWTLLPMssw==
X-Received: by 2002:a05:651c:117:b0:2c9:fa20:89e1 with SMTP id
 a23-20020a05651c011700b002c9fa2089e1mr2063453ljb.9.1701997864531; 
 Thu, 07 Dec 2023 17:11:04 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::227?
 (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a2e94c1000000b002c9e6cbf78esm86616ljh.19.2023.12.07.17.11.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 17:11:03 -0800 (PST)
Message-ID: <22f39a38-6293-424e-898e-77edc071ef75@linaro.org>
Date: Fri, 8 Dec 2023 03:11:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: Fix platform_get_irq() check
Content-Language: en-GB
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <c12bb69b-d676-4345-9712-48aab48f2b48@moroto.mountain>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c12bb69b-d676-4345-9712-48aab48f2b48@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: freedreno@lists.freedesktop.org,
 Bjorn Andersson <quic_bjorande@quicinc.com>, David Airlie <airlied@gmail.com>,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 06/12/2023 14:02, Dan Carpenter wrote:
> The platform_get_irq() function returns negative error codes.  It never
> returns zero.  Fix the check accordingly.
> 
> Fixes: 82c2a5751227 ("drm/msm/dp: tie dp_display_irq_handler() with dp driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

