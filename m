Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FE7247AB0
	for <lists+freedreno@lfdr.de>; Tue, 18 Aug 2020 00:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE0789B4D;
	Mon, 17 Aug 2020 22:51:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4216589B4D
 for <freedreno@lists.freedesktop.org>; Mon, 17 Aug 2020 22:50:59 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id f5so8272429plr.9
 for <freedreno@lists.freedesktop.org>; Mon, 17 Aug 2020 15:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=SQkF1er9CI/HdoW+CwMyTYmnG8SOeqdla6TOsxwwXL8=;
 b=EVAxOV8OGoEBu6rnvdmhL7nV88zwX29yi/vbnC+n+vOBoGdfRXKTYRNxwwIeZ+BjCL
 n00zv8FJcL4GNWB1T9HqvbiknMeFsz4MVl/oKDDvDv4xSzjhGPRsrR7FG1kxoxuIVabp
 rL28hlM7qopNZnIsSx/06Xt488jLS5/+IANV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=SQkF1er9CI/HdoW+CwMyTYmnG8SOeqdla6TOsxwwXL8=;
 b=YflkSaAh+7/3ZtiVa13dRVL2cl7iauKdLpVbc4DQGwPMx6mrT08NrEx7OuxrBGrVd9
 QnIkgg3GGAX6kziSuAPlR84ahwXL3g5u7i896W3xdxobb3NulFc7VNBOYuZ58cCckajv
 V0CtosR+OR5g3KIMMCV1AUo696CeE6ZSi8rQiKKsfgjSN/i92usLC5SnlUjJBF1Txu5Z
 92oXEhCscBREZYMh91egRtArdjeHrAUwQUEU6427r2ee4igk3cyXLdkMCm1yKi2M2mvs
 gADXKYPCA9Inuc9dvsQ33RnFOKsFWlrHqqwXtMI/Kr5accJ0y3f25gghoRCTr5e+E9Uu
 CGdQ==
X-Gm-Message-State: AOAM530CYqAjXAoRKdddS4jj3G6ruW2MLlDD1RWnYR6BVjlQwLhoVSI6
 WjK3hJPNkdSZRT+QPzHWKtvDpw==
X-Google-Smtp-Source: ABdhPJyJOVgzQkXpdtBDVbGzjM+WmdvtLlVBSbnc4J38wcBX/4/0hz901JkQfbgFaPFVLg8jtt6UJA==
X-Received: by 2002:a17:90a:d252:: with SMTP id
 o18mr13953355pjw.146.1597704658834; 
 Mon, 17 Aug 2020 15:50:58 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id z23sm18201207pgv.57.2020.08.17.15.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 15:50:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200817224527.28532-1-tanmay@codeaurora.org>
References: <20200817224527.28532-1-tanmay@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Tanmay Shah <tanmay@codeaurora.org>, devicetree@vger.kernel.org
Date: Mon, 17 Aug 2020 15:50:56 -0700
Message-ID: <159770465685.2423498.15137387317243148552@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH v1] arm64: dts: qcom: sc7180: Add
 DisplayPort HPD pin dt node
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
Cc: Tanmay Shah <tanmay@codeaurora.org>, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, khsieh@codeaurora.org, robdclark@gmail.com,
 seanpaul@chromium.org, abhinavk@codeaurora.org, daniel@ffwll.ch,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Tanmay Shah (2020-08-17 15:45:27)
> This node defines alternate DP HPD functionality of GPIO.
> 
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index bf2f2bb1aa79..9f97cf5dd9ab 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1457,6 +1457,20 @@ pinconf-sd-cd {
>                                         drive-strength = <2>;
>                                 };
>                         };
> +
> +                       dp_hot_plug_det: dp-hot-plug-det {
> +                               pinmux {
> +                                       pins = "gpio117";
> +                                       function = "dp_hot";
> +                               };
> +
> +                               config {

The node name is usualy called pinconf. Please use that.

> +                                       pins = "gpio117";
> +                                       bias-disable;
> +                                       input-enable;
> +                                       drive-strength = <2>;

My understanding is that drive-strength doesn't do anything when the pin
is input. So this line should be removed.

> +                               };
> +                       };
>                 };
>  
>                 gpu: gpu@5000000 {
>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
