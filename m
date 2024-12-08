Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0F19E84DB
	for <lists+freedreno@lfdr.de>; Sun,  8 Dec 2024 12:58:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B961010E43E;
	Sun,  8 Dec 2024 11:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DLFYmzPg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E6510E43E
 for <freedreno@lists.freedesktop.org>; Sun,  8 Dec 2024 11:58:37 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53f757134cdso774593e87.2
 for <freedreno@lists.freedesktop.org>; Sun, 08 Dec 2024 03:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733659115; x=1734263915; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CysgqJSoA6The5y4gGxS6RuFPaDLlk4I3KIup58ZBcs=;
 b=DLFYmzPg8rTR6JSbQ4KnoqgbOovHddSKGcjqc1SO3Jjg5Tk5ZIGgqIV0SvRPJ2XiFz
 lJM/EEk+FnVgHCgCWR5i+eMa2iI/58Mnty6NmbUHmmazOiAlkvbli9mPePLxxr/EELoe
 qw5F9mblc0csMfo1vQQgpjkLG+Ud/ZCdUytx6JxI4l4WuNdYVyAq3mzyWjFWAj4mjO3F
 EjANSbVcmJ3YtJg5yfCA7WdceojCtV3yjxsOj09FxNa5zRP62C+vKXoTlyNKSTYKmG5l
 u24YZEgoh0eAGsnXF4DEkvwhyiUqkIwnWfNN/jPjeznFqWUZ0oDo9spjy534StttK2xv
 HUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733659115; x=1734263915;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CysgqJSoA6The5y4gGxS6RuFPaDLlk4I3KIup58ZBcs=;
 b=Xo6wxJjn6lAuMUAHzwOlvGgMfZVxtWSWd7xaQnexWXQWbf2Ml+ZeluCCGOGuNkk9fT
 HbDgsxff90CUqzIdjzT923ZdmteV1WrOLhFd1kMfE9UqvKuB2qBHtJtWGQtj8VSGbeVQ
 fMFPI6n8wGdsIp75UnSCnLLFBXJTHi4cMXN5IOyoJ0klstAsaKr9NMjyDYX7MxJvO4sa
 9nrYQWR5TtpJb/YUJ1oEqNTmlzUt1sNKN0PUxCQhLtkhq3rH4O3M15Zyl3FJNb1OkQu1
 a6nUj8aEPPgBPeKPXdjGfXS4wnl/jcSzQCjWXL3+jxTeDRn2wz0BIPft5c4nbDKj1KxD
 vXvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo8D0g1ExiYUhQlQesPVSEkN1Pw1uEt5QTGtCUhHiHKJxSyB3KCEt1YWU19c4Ie//L+v1Xp3t6VdY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlFAScBosz9VTv2DPTUaqpQTlVS1loeG42WBXO70OjFTSAip7j
 tWCPFH/ziwgA/7KEAS4Ny5yI9hYABjCKh9zI9OzJxwLClDn/Tf649F7DTdgV3II=
X-Gm-Gg: ASbGnct6cQ0Uk9uKmfCxB+UaFjxsggZIVOlAu5164OHk605v4ikGBAyKioa8eS7aIBz
 t3nhvtHPsWZQd07xkBHdM9I8smDoCbv7hXmLCitns5FKjv/fN0uytmoqpHMRY9EZf38bsfL0srh
 Xn8XsrlInhihefh1x9vJp9suXE0obK5auoEsiavZlWN3qMfwh+/PCuPk/MX5CiiR9yb7aOxrznN
 65L9sXqqM+ukYpRdwGebwMSZj7veWqEg9R7ihBOimZw7FFmFvpLXuQkT23x/CnaMWIpUgKdK9Fz
 q48fsVa+6yQjzmyQjVjBSysQkXPaTg==
X-Google-Smtp-Source: AGHT+IFMxzujaEusISBpEqUr26OQV2IrA+gNY14wgz09Z76uRnfMuKHilK9vldlA5zCo+wLBFIB44w==
X-Received: by 2002:a05:6512:3d07:b0:53e:3a7d:a1df with SMTP id
 2adb3069b0e04-53e3a7da2cdmr1577018e87.45.1733659115464; 
 Sun, 08 Dec 2024 03:58:35 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e94f77f3fsm424275e87.217.2024.12.08.03.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 03:58:35 -0800 (PST)
Date: Sun, 8 Dec 2024 13:58:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 42/45] drm/msm/dp: mark ST_DISCONNECTED only if all
 streams are disabled
Message-ID: <blxp4p56inbzlwmnsj2mw3pllioemgwmyxmu6eqo2oicl5dbth@exdch2z3kk6a>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-42-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-42-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:32:13PM -0800, Abhinav Kumar wrote:
> HPD state machine assumes only one active stream. Fix it to account
> for both while marking the state of the hpd as disconnected.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
