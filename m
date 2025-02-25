Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1380DA4479B
	for <lists+freedreno@lfdr.de>; Tue, 25 Feb 2025 18:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4EE10E772;
	Tue, 25 Feb 2025 17:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pTLQgqkU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9ABB10E772
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2025 17:14:54 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-54524740032so6003121e87.3
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2025 09:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740503693; x=1741108493; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+dODZ+7MTPPBH6S67MBivWnFKuk0Orcv5ZDM65vBwrU=;
 b=pTLQgqkU2DQ5VlHKNgS+Cpmpo7yygf4jAo6Stlml10uLqhI9UTTsxKeeX5WiLB1GvU
 dZOCoWlorSS85nx5M2GnSH1xcy1QApbhm5arwP5/HPVRrAAnWNJS9x9scQFzSPVcVj//
 q8pnc5LVvIyt1g+d1wCpNrKkbbOFfsZewS4XmsOkouC3kdUkj5JsQBLn7A4TJBC/F5Bw
 WXTOvqVtp0ZR+E2usHr29h5BV3j4oozjKLvtnwPYvIuRL6r2e14Fs6c08iAysaf2YjEm
 V6OaAzxLmsvH1p1u4fpig/8ro2hsACnWLwpKWXL5dlsAFWjRNmb1i52XjBFgZ4RhIqXf
 iaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740503693; x=1741108493;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+dODZ+7MTPPBH6S67MBivWnFKuk0Orcv5ZDM65vBwrU=;
 b=wHB3VfMMgeoAUXvlsRrE0DYEafjgji0fpVYeog8kf194Fl6Z4A6oU4t9AwPRFp+OF6
 Hl0MWiZqwpAXRYAYyU+PUaJrX8eZbudH+laINmgdBX3PyLWxtthRtgZlswOuGVWaJxiJ
 VFAS42w1ItG/ijWqXzlCkcLKApDhVtnURPhwxMpUHbsdxatyLTcW1lgK06ozSIiD5GVw
 cTZSqmmvU6qc5VqjohHdvu37EDYXKteKWAxVf9ZugzuPIe48Jou/K8R+4eB1LoVY+r1m
 PBCOYD16GwzyRkZ/DMU1DHN7U3vXh4md04dwl66E8NMIRVxhIVJyk6nkkAGf59k3S47L
 ixbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6buJZHxm4zzzDgGr7RYLqywVB+GPESGkq3vPSVW9zxanY2tW6SKuoNeImF5ghjlz/ufyzvj2cj5Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy43w1JGjLWsQCChbV701ow/rFPHf5ikR4Szdurm/nxRVj4ZkD+
 6IbO8nBDcTAZ4q9/X1i3uOMa5aNVCmHb9kzjSqj+Yfy892KKlwI5vi0AhKOfdrw=
X-Gm-Gg: ASbGncvOtlYeof3a8fD+EfP4evYB0TiDK/7LNsx897lWomf/05MjvKpVsS0etbphCxS
 Z8nIZ3AltkPH9I3WF32N4wQ+tJ0BQ5zQm/FV0EfCj0ddrvSgLz3kJReGxBeDKPUAbnU1NR91rBt
 Guc78uiJiCKhazE2G+Anf1/n9+PoBNzbC/fYlRiwoqbwVnZFkexEtXcfKqaXTdzNDyb3X99rK2f
 PDz8RgdvVhbOblLR/WFOc0WO84rmAw3ltilsoZFdeQwiIR6tEL12DfLg79wUFBU0aJ0H15NKDL3
 FEgzFw4cLn8sxBc0gFBL+6KzS7tolpUhEA3M+lQdnIRu1EFqDds91xMQxJi5L69vc0lx7uhsPUk
 A1sfQiQ==
X-Google-Smtp-Source: AGHT+IG2JNWtG5t9NbVNuoQ9NN6EnQTrfMLDjiH8gZ0sx1WPbonGS4f2ipr94i56nk1lp01l/rVSZw==
X-Received: by 2002:a05:6512:3d16:b0:545:62c:4b29 with SMTP id
 2adb3069b0e04-548510d2891mr1850229e87.22.1740503691782; 
 Tue, 25 Feb 2025 09:14:51 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514b237bsm233549e87.4.2025.02.25.09.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:14:51 -0800 (PST)
Date: Tue, 25 Feb 2025 19:14:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org, 
 andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org, 
 konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com, 
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Subject: Re: [PATCH 04/11] drm/msm/dsi: add DSI PHY configuration on SA8775P
Message-ID: <jrlpgcg4f4p76muibh4hypdjag2fl7ex55bspxhkjya6dyqjin@gcsrrrtoggcg>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-5-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225121824.3869719-5-quic_amakhija@quicinc.com>
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

On Tue, Feb 25, 2025 at 05:48:17PM +0530, Ayushi Makhija wrote:
> The SA8775P SoC uses the 5nm (v4.2) DSI PHY driver with
> different enable regulator load.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 27 +++++++++++++++++++++++
>  3 files changed, 30 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
