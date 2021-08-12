Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E2B3E9BA4
	for <lists+freedreno@lfdr.de>; Thu, 12 Aug 2021 02:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751F76E210;
	Thu, 12 Aug 2021 00:31:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028196E209
 for <freedreno@lists.freedesktop.org>; Thu, 12 Aug 2021 00:31:11 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 r19-20020a0568301353b029050aa53c3801so5639770otq.2
 for <freedreno@lists.freedesktop.org>; Wed, 11 Aug 2021 17:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=PLCgWUlIwJKxfCShn29qzVeYMAxb9Jy6/zN3VIhO6gc=;
 b=F+OYirtrBGe89AnSkLHY5okk962mMXPAjiVYp3bwDE3Y0e6yJEGiSoJa1Amx7Jm/zz
 fSUSKYN5T+ZdYRgOOq1FEn2NxKXPC+HEYR9HYicAEF4RmfkFpX5U9cbrlwF+eUFD03FY
 Tq0DAX9aAxh4iU/4ulEK/J7zMULXUXeWovJbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=PLCgWUlIwJKxfCShn29qzVeYMAxb9Jy6/zN3VIhO6gc=;
 b=RPeN1+6QbYllMPcPDWSZf7kma52dO0LT1ck7Ak25MXw82d4ub68GiNA189vawl3dXj
 Qex/NeeeqqSSNuZfvRerMp7vIOCQjem7DcSNXDc6yrnksRsdwHzxrM4GhE5gL9kg0Z7J
 QioIzVAH5AZ+ic1G15rvC2gYF5PK8f5QJrqphD0cskK0bNUYaZQEljk4wnU2BtUzf1Ga
 PwwxJmoruLm3+89/nqeI0vSyvclHdPT6GJSPKPntGo6dsME2DpSR2KIfgdvrN8r8ePRT
 1djzc3cHEw7rFlNI9WlsVzeKiwmhWtCpwGRdquBv5iJvckrKxZgwbcghfMPxQ9gdvBCh
 C6zA==
X-Gm-Message-State: AOAM530/w/JdA7TYUCBRTJrfLB6atXSrTwC2Enubd2BxMlz1V4RfD7iH
 1CVUFhefbJAPXM+SLCA5YMxh11HbzE6t3v/fW8lLVg==
X-Google-Smtp-Source: ABdhPJyG97deqUVD5kKCSHP4TSJP+P7NfrbuOt/mh2i4whlYEQ588RKKNWLWiM2kuB+OHQvyR9jjX5MbyQcTVdydZn8=
X-Received: by 2002:a9d:5542:: with SMTP id h2mr1286181oti.25.1628728271301;
 Wed, 11 Aug 2021 17:31:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Aug 2021 17:31:10 -0700
MIME-Version: 1.0
In-Reply-To: <1628726882-27841-3-git-send-email-sbillaka@codeaurora.org>
References: <1628726882-27841-1-git-send-email-sbillaka@codeaurora.org>
 <1628726882-27841-3-git-send-email-sbillaka@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 11 Aug 2021 17:31:10 -0700
Message-ID: <CAE-0n50RF7fCC+Vic9DpT6gjcYrmTzd+7M6Y9SAhgLoD=_Sq7Q@mail.gmail.com>
To: Sankeerth Billakanti <sbillaka@codeaurora.org>,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, seanpaul@chromium.org, kalyan_t@codeaurora.org, 
 abhinavk@codeaurora.org, dianders@chromium.org, khsieh@codeaurora.org, 
 mkrishn@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
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

Quoting Sankeerth Billakanti (2021-08-11 17:08:02)
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

Please sort this alphabetically.

         - qcom,sc7180-dp
         - qcom,sc7280-edp
         - qcom,sc8180x-dp
         - qcom,sc8180x-edp

>
>    reg:
>      maxItems: 1
