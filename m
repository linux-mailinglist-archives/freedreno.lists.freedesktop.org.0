Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 277C6A4490F
	for <lists+freedreno@lfdr.de>; Tue, 25 Feb 2025 18:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0321210E1D6;
	Tue, 25 Feb 2025 17:55:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Zdkd0eYR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0D610E1E4
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2025 17:55:42 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5462ea9691cso6551900e87.2
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2025 09:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740506141; x=1741110941; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eq3mOy20yNbp2lX3RjGrzkzUuuAverI0Nvq0Wo8uGL8=;
 b=Zdkd0eYRcNFwWqp/m8hSj8su0wkrx0DcT67YYxpHh740xqAvlmOEDPgoEJ0f3j8XvG
 GsnnPpO7usT5Tcara4aU3U+sCVyXmdS6hhqVjzeNyDkxDbaFi8QyuAL3q/Iz/CaYe5DZ
 kA9NkqqufBQtrUiMNCMTVK12gAk+0oHMpH+A9Nf+ociNPIWuowgRaJhVBXJcdHKIhrYs
 BnNRrsV3dJbhIztPXi7Emx6S1WAJBeMFOizxGX+7aOuQj2X7d3gy96dDI5rFQPAWhRr6
 h4M3LI0d7BEF/ogUG3eN/vvt1lSp6jZ6Fk0vEeMHD3gntdol8qU4ISt1PZ8IRb+/XSCt
 czDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506141; x=1741110941;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eq3mOy20yNbp2lX3RjGrzkzUuuAverI0Nvq0Wo8uGL8=;
 b=tkXytT5cj+pd7sR8xUXqd3x050Pj7eqbTBquWR9THw11OJEZ/lBq/G+tS5xU361sUY
 4dTQgQOhICTfnHNX6Qf7A7i+QczsRE6OV5qQpl4pwSSnhWWIIEoKqa02Urc0mT/HChGw
 fUlosFBIr9o8rgtRh66cJHlwmuI3+Q5l/NIaMQKqImfdpKoAFZAs+tb99w4yOutCGVDd
 6NvSpMDF48tEt/aSjcbXqd9ltUFTfUsOQPiFscxS3sSJP7FYEleUW0JqFTx8cOMXZX1m
 rERqoEjtiKWzZ3YoPPXjG7eN2ZtA8Cj9/kSzxySyXSzyQ/VgkzDt+s9TOwt5T3FgAMTy
 7GNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzeGnEbrxmmHJTL+pRYfkt+/4+sEHreH4TecVYRbv4BxSiuTjD5bf4O/kAsmJrwsDS6+mXK8bs7Ps=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFj8jiuQmJUomwWqfYdo1r0IQclV2gpYpNLkkAR2SaIjyj2Y/4
 UM5/0/Fh8YKDlrs7aizCTAUC01kypUHGnhKzbJwgnwQWNBvd1lpurx1bobSX+tI=
X-Gm-Gg: ASbGncuHSlYj4eT0YfhC1yU6Btq+xHGSh3aJ8yMhU/N4/Xiovz05Nj7fgEw/yFHwn+o
 7i3m7H6NFk1hSKrZCf1skDNKAIv9NNJXHD3kgUgiJ6J4UgOjx3/kHq+I4ueuPu1Zyk7pHVBGUGV
 ZYTZQR67S/S0a/+7Nv2BMz7S8HRP1XTe0tv/fx07yJ5+ZOZ+pZrIozac5sx75YdiMwMo5Hot9bk
 C0zIc0or0ZrkVzQWo9fqJuqzbbF9uvFc/vTJtrgM8M+SiY1H1GgphNjSacrskQAOi4uCsIAkkZo
 zh+o4vivwUCByTMSeFO35ZwixpQYcJQ2bO9nvxDYjX6BNnkUuWXem9/Q2NookgC2EfJckzcUDn0
 D2rF03w==
X-Google-Smtp-Source: AGHT+IEtBPGhJEFmYORVcpbY565FvoQ1gkddd4xE4WqD8kbOZNOXiopkLnrRw1ytEuGRZvYQRQselw==
X-Received: by 2002:a05:6512:3a82:b0:545:271d:f92 with SMTP id
 2adb3069b0e04-5493c57ef04mr234185e87.25.1740506140684; 
 Tue, 25 Feb 2025 09:55:40 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514ba1d5sm243569e87.98.2025.02.25.09.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:55:40 -0800 (PST)
Date: Tue, 25 Feb 2025 19:55:37 +0200
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
Subject: Re: [PATCH 08/11] arm64: dts: qcom: sa8775p-ride: enable Display
 serial interface
Message-ID: <tfd27qk543dt4sqcawogoszsjax3cqxmi6mcy3qd2mwzauedpf@l6xmy5okswrd>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-9-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225121824.3869719-9-quic_amakhija@quicinc.com>
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

On Tue, Feb 25, 2025 at 05:48:21PM +0530, Ayushi Makhija wrote:
> Enable both DSI to DP bridge ports on SA8775P Ride plaftrom.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 66 +++++++++++++++++++++-
>  1 file changed, 64 insertions(+), 2 deletions(-)

Please squash into the previous patch. It doesn't make a lot of sense separately.

> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 151f66512303..02d8a9c2c909 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -128,6 +128,30 @@ dp1_connector_in: endpoint {
>  			};
>  		};
>  	};
> +
> +	dsi0-connector {

dpN-connector. It is not DSI.

> +		compatible = "dp-connector";
> +		label = "DSI0";

Is it an actual label on it?

> +		type = "full-size";
> +
> +		port {
> +			dsi0_connector_in: endpoint {
> +				remote-endpoint = <&anx7625_1_out>;
> +			};
> +		};
> +	};
> +
-- 
With best wishes
Dmitry
