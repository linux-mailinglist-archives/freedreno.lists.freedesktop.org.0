Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C66909C8998
	for <lists+freedreno@lfdr.de>; Thu, 14 Nov 2024 13:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67E310E2A1;
	Thu, 14 Nov 2024 12:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EBzgp1kJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C86D10E7E8
 for <freedreno@lists.freedesktop.org>; Thu, 14 Nov 2024 12:12:54 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53a007743e7so559633e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 14 Nov 2024 04:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731586372; x=1732191172; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=R1osO7NFmTGmX19JFLUCez78ik/qFqOXaEh8yYgfrqY=;
 b=EBzgp1kJyiBdfFmq8qc3sd5Mxrd/zeR+34sc+YACpygZ/fEyQBQfwAz0UBAqJGGXOQ
 tbPZRn/0fvjeG9o0WwL+iAWru/ADif2kj5bLAgRKtEcspJaEh8G39AGwJYFHvPKtusTy
 am39rNPUOrsy+87rlnOzTLDVWZJaNYTZKJscTrp6WS89iuheCYnR+xCN8BQ3/bpzt3+t
 QrCmCi/UsJA2Re9bvgVLiyBbfqSHMY08lJnWXj3D8rWgNpNsLYxa+ktzwKD389rqwH0/
 Z2z9xZcgZHr67gFEdk6cWr2SDtbjagBJilNt3E6QxtCshCShYgbHeU6hhF0sg/I1p1WF
 eLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731586372; x=1732191172;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R1osO7NFmTGmX19JFLUCez78ik/qFqOXaEh8yYgfrqY=;
 b=U5k0KjOdcHC7juZwFGgh4zicQNhPlgb6FftfBy9vvLgsCzGljWb6Rtkhlb6RN+BqQY
 k2bQt+rMJIHYSaL2vtdmE91o6jTT6a7VL5V/hrGzq05HzP+VU7pMGUkpJ8qEr8g9v0L7
 muVwASasYfsdJ9dXHxb2bY4hvgs40IeRW9pTJuV7U6FbyD5v05lXKlndpXKMm6njtUmj
 91IsM0VMUJPA7BFJIubU28nkhBuXXszyijuxRL+aZ2KwL3iNAQZfZxc0i0B6wqX1+lCh
 iVlBPhpB3/eF8YtvWp16m+Tmg/JF0jz5vHUkx7+Y4UT1oBBhjkFx4qCCdekeDQV0FgoQ
 DmRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHcL4m/vUpQocaq95d8k+2KlfSIgIWkRw7B0qjyNl0ZnZxconW/Cwn9250UV4tWy5tvQjx0sE9iDY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz28LGoHi7A77YrK0RctWbJ2ariaJgtPphpZul4OJNpeUQA+V9c
 YZO2Bg5cSxh4/3bCk70PAuaIkf/GWoitkcO2Ko4Oml/z9O/Q5InWBAVpuzLogZM=
X-Google-Smtp-Source: AGHT+IEuR0xLWMXeFH8Hj+BtIFR3zIeL3E9KlzQyVZ9bHzcIKoypj3g/lYGAKeRXG1eysRTlMVJEog==
X-Received: by 2002:a05:6512:3e17:b0:53a:7e:bcc6 with SMTP id
 2adb3069b0e04-53d9fee3452mr3399322e87.53.1731586372180; 
 Thu, 14 Nov 2024 04:12:52 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53da653dd4csm162919e87.170.2024.11.14.04.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 04:12:50 -0800 (PST)
Date: Thu, 14 Nov 2024 14:12:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rex Nie <rex.nie@jaguarmicro.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, airlied@gmail.com, 
 simona@ffwll.ch, avrac@freebox.fr, sean@poorly.run,
 marijn.suijten@somainline.org, 
 jani.nikula@intel.com, mgonzalez@freebox.fr, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, angus.chen@jaguarmicro.com
Subject: Re: [PATCH] drm/msm/hdmi: simplify code in pll_get_integloop_gain
Message-ID: <gqej2hhenngqzcla6mgxywfft5qbpglrlotetgiezdrt5t5fjo@tpazzxp7gleb>
References: <20241112074101.2206-1-rex.nie@jaguarmicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112074101.2206-1-rex.nie@jaguarmicro.com>
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

On Tue, Nov 12, 2024 at 03:41:00PM +0800, Rex Nie wrote:
> In pll_get_integloop_gain(), digclk_divsel=1 or 2, base=63 or 196ULL,
> so the base may be 63, 126, 196, 392. The condition base <= 2046
> always true.
> 
> Fixes: caedbf17c48d ("drm/msm: add msm8998 hdmi phy/pll support")
> Signed-off-by: Rex Nie <rex.nie@jaguarmicro.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
