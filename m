Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7A09C6EA8
	for <lists+freedreno@lfdr.de>; Wed, 13 Nov 2024 13:08:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F305B10E205;
	Wed, 13 Nov 2024 12:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CQw4cOUN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DD010E6DC
 for <freedreno@lists.freedesktop.org>; Wed, 13 Nov 2024 12:08:05 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-6eb0e90b729so34112707b3.1
 for <freedreno@lists.freedesktop.org>; Wed, 13 Nov 2024 04:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731499685; x=1732104485; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UGtyXwzMBHOXtnkZD1IDl7RIyBTD4iUeJ455sdaUv4M=;
 b=CQw4cOUNz3MS8PHS8KAUqEnfxEGaggGyuEvSONfQX3GU0iYktYOmS4OKcce6KMWkz/
 gdVSD9rz/H4qRvHQKz63WkkZKwpYxuMzldFtlapuP4GzPij+Vv29cQWdNpYHQrMbJqDy
 zshDcrrhvaiyHLA80COgGZUylIBwf8UR9YVMl6nbyVbwkXD0OeUIrU/Jzm+fW/VNIPzU
 gu24VoAEHrUejEciuy4/AoOHRdqvyQ3WeBHcwN7bL6zlnRMxdDU7LBNnBcdHOBmuJSE4
 ZdnHumZwwo27eJVJHOdVEB3Xc0Bhd21d868iROg95fBGuTbnjmCiy9mQvnT8VaRPHdM2
 GPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731499685; x=1732104485;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UGtyXwzMBHOXtnkZD1IDl7RIyBTD4iUeJ455sdaUv4M=;
 b=n6wmwfCrgv0nQoLMhIGXqC6Y2/XoVAD2cMuWmhWdXSWie28uS/TPZ3HGXDUrHW3MFD
 eC9o1/+SZ1OUo6OGGzTa4y37zYQrTXUROE/eqKgSYS7sa1+X5oIzm+jBRRwhPwyXSfoJ
 H9RjlksdgllFupLPMTuuxFjm1+KEfiVkRcszuk9UP0aCcPeKLIMhgHBh42qr6iIQ+XI+
 5ddNF42AoybLS5KPDI9aHh08By/kYStB29e0WfwGZNw1uSAvzw8SBjnkE1vdrrY04H0o
 5vPl5IOGFnJswERpTnuOW6lQXAGiNwRc2eAOXCPHtu60rl/jdXSNOPFGCorWPWGKefbf
 O5Qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOuV0rHrijJuFJ9HVvWp20vQnlM620hnuuqvTA17QEujPa+7D10v3yXR/+kNUCw2VI9AB0ROUVRds=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAdnWHzak7Hmn2qgXa9z2LfLEMe7+UEYhMNMNwgjzn7SWY7FB3
 x8kKyLy7wqOMHw2HXOykMoHVC2govSBBOqimXMTU7fSX/xf0jteqkeSMSjG/ifzKMh34FYl3RM5
 aOyUJz5PEHY18DKIfFY2wg6WzF805jJau/kqbqw==
X-Google-Smtp-Source: AGHT+IGfdj17ZRR0vuBfO1QBwX6EXMq129/94BCmEcrTpxI9KLT5gLVvRTesocXnNuXdBrs2dgVgRPYFjcVuJRn6J6s=
X-Received: by 2002:a05:690c:7485:b0:6e2:2c72:3aaf with SMTP id
 00721157ae682-6eaddf81805mr207193107b3.31.1731499684980; Wed, 13 Nov 2024
 04:08:04 -0800 (PST)
MIME-Version: 1.0
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
 <20241113-add-display-support-for-qcs615-platform-v2-1-2873eb6fb869@quicinc.com>
In-Reply-To: <20241113-add-display-support-for-qcs615-platform-v2-1-2873eb6fb869@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Nov 2024 14:07:53 +0200
Message-ID: <CAA8EJpqQA3zDBRpm9FY5X-vS0aDgoGNFfDoTh9p1A2MqVa7KNQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: display/msm: Add QCS615 DSI phy
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 13 Nov 2024 at 13:53, Fange Zhang <quic_fangez@quicinc.com> wrote:
>
> From: Li Liu <quic_lliu6@quicinc.com>
>
> QCS615 platform uses the 14nm DSI PHY driver.
>
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> index 52bbe132e6dae57246200757767edcd1c8ec2d77..babd73cdc44f6d12fdc59c6bef27c544d91f1afa 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> @@ -17,6 +17,7 @@ properties:
>      enum:
>        - qcom,dsi-phy-14nm
>        - qcom,dsi-phy-14nm-2290
> +      - qcom,dsi-phy-14nm-615

As stated in the comment to v1, no, this is not acceptable.


>        - qcom,dsi-phy-14nm-660
>        - qcom,dsi-phy-14nm-8953
>        - qcom,sm6125-dsi-phy-14nm
>
> --
> 2.34.1
>


--
With best wishes
Dmitry
