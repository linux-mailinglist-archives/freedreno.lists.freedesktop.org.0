Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2605C3EDCBC
	for <lists+freedreno@lfdr.de>; Mon, 16 Aug 2021 20:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92DB2899DC;
	Mon, 16 Aug 2021 18:01:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71631899BB
 for <freedreno@lists.freedesktop.org>; Mon, 16 Aug 2021 18:01:46 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 28-20020a17090a031cb0290178dcd8a4d1so638060pje.0
 for <freedreno@lists.freedesktop.org>; Mon, 16 Aug 2021 11:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CQAn3RJnCnEKhUAHlpFfnDVdKYIBRS8GR6cHa78A0bI=;
 b=OiP/jE5lIKzaI86z/cSbkWq8KS+Zn367o727+x1oyIZCvtiHty5VuI3vR9Wd9m/DKC
 mrAvJapyrn3wsenqZ8mHt9roDOSCGfRyzs/k1mCcI1rBa1xvrOhQ1kmKQT1zcDOSS1FB
 9jlHPQve9GjHuRcHIygklthjRruh8CAuZ7VKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CQAn3RJnCnEKhUAHlpFfnDVdKYIBRS8GR6cHa78A0bI=;
 b=rAjZ0e6DS62q47M5ROEZTwpflQfUvmUor6Ki/ctJDKUwMQjxBf5SyLVrXfRCscHfGE
 A0FMCI3LiHOAoH4GV8jJbw48m/uPB02XidipITHAcGoRTJ7O3BtpwKQbM3cpZjRqcVsn
 icAG605W4aYlg+YdTL/6dV0Uj/3rEvSPp9oQO/jd30Efn9XrZI9Y/QTJhL0Xzsohrvnj
 WObz4K8X8X2aqzPmzTttX390PoVP7wUBy3Sr17sDAwrL1WVt62FEwzOtUqX+wJGhK9ds
 FRf/YAg+kFtWU4XGNnLN1PT231rYZbN2chAr6aJfyBLfqpcw0VlrxZB4KXVCN1N0kG90
 KZ3g==
X-Gm-Message-State: AOAM530eFkEVwJdJWwGgBTLyk90J7z/ggndQATa5XUNAF8M/s3wP4r4c
 dXtKsZwjpOGhEOyx2EflKUJU3g==
X-Google-Smtp-Source: ABdhPJwa1Xm3ePFA3SuM8XZOqgsVOXYMQm8FtguFpY+P9+T3EtyPVM2ryfi8HpcN6WgUHqWEMqbCBg==
X-Received: by 2002:a17:902:a609:b029:12b:858e:d116 with SMTP id
 u9-20020a170902a609b029012b858ed116mr104173plq.25.1629136905928; 
 Mon, 16 Aug 2021 11:01:45 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:5cff:3a19:755c:1b91])
 by smtp.gmail.com with UTF8SMTPSA id x12sm63119pfu.21.2021.08.16.11.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 11:01:45 -0700 (PDT)
Date: Mon, 16 Aug 2021 11:01:43 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Sankeerth Billakanti <sbillaka@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
 kalyan_t@codeaurora.org, abhinavk@codeaurora.org,
 dianders@chromium.org, khsieh@codeaurora.org, mkrishn@codeaurora.org
Message-ID: <YRqoB2UEJtVcr6AN@google.com>
References: <1628726882-27841-1-git-send-email-sbillaka@codeaurora.org>
 <1628726882-27841-3-git-send-email-sbillaka@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1628726882-27841-3-git-send-email-sbillaka@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v1 2/2] dt-bindings: Add SC7280 compatible
 string
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

On Thu, Aug 12, 2021 at 05:38:02AM +0530, Sankeerth Billakanti wrote:
> The Qualcomm SC7280 platform supports an eDP controller, add
> compatible string for it to msm/binding.
> 
> Signed-off-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 64d8d9e..23b78ac 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -17,6 +17,9 @@ properties:
>    compatible:
>      enum:
>        - qcom,sc7180-dp
> +      - qcom,sc8180x-dp
> +      - qcom,sc8180x-edp
> +      - qcom,sc7280-edp

This adds compatible strings for sc8180x and sc7280 (e)DP, however the
commit message only mentions sc7280. So either the commit message needs
and update or the sc8180x compatibles should be removed.

The driver change (https://patchwork.kernel.org/project/linux-arm-msm/patch/1628726882-27841-2-git-send-email-sbillaka@codeaurora.org/)
adds some (currently unused) 'io_start' addresses which are hardcoded,
I wonder if these should be in the device tree instead (and 'num_dp'
too?), if they are needed at all.
