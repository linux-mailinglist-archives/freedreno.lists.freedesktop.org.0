Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 515814CC887
	for <lists+freedreno@lfdr.de>; Thu,  3 Mar 2022 23:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36D910E331;
	Thu,  3 Mar 2022 22:06:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E3810E331
 for <freedreno@lists.freedesktop.org>; Thu,  3 Mar 2022 22:06:25 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 w3-20020a056830060300b005ad10e3becaso5825584oti.3
 for <freedreno@lists.freedesktop.org>; Thu, 03 Mar 2022 14:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=a98NmfLmxPwElplSUG27m4JRPCjHA63Gw4sinoazLJY=;
 b=GobSvDa3VrHxA7j14C3x/nMk7a8rt3B6ncIMZ/6ZB248iDm/WJ8X5MFgEZQdYEgc/N
 xEMoAprLTjD4kd4E34oMF6mshpLM3QZk1bCU5aMsnZwUiBkujKZXg1ke4s8xeK505b/b
 L9cgDH8QI5yBfTrxVVK3LKj0pudr64Mqiia80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=a98NmfLmxPwElplSUG27m4JRPCjHA63Gw4sinoazLJY=;
 b=Y/3w+I5VURANUc9lZbL/olI/36ff9BYn0BQ+Ch8cBVFjI1tTb4UxtDGKbPpLVCPSe6
 amJ48DZqrx4nS5EUbrTKO13Hp3WE8GF6aF9PZQKrmW6Aa4TbwETipOVdB67ypehnn7My
 Z9JxP6XdxLNKNYQcko3++DerLZbsk4VYw+5g7BKGD28yde85yGHm+Zgv//0mMu1QWdR8
 O/Lg2QzPzftMycxaoueYfjyNjLqd7fp1oquuIsm1byxZwYzhNQoCqxrIuGzt8PVILVIN
 3GxpBAM8g/yuWd3hF+SmjNFfqA3gHYTN7zwCuIBmb0V2oZQyvhMzPe/mLoifJe0EWKHY
 qOog==
X-Gm-Message-State: AOAM530bSzmcVDWHcoApJohHRVzyX9D6ENEHki6HvQ82I4uSudU5hgpJ
 sgDzhL3G5bdQrBcP+A36Nb8jfZKYmR3rgqqSIjfIgI79Z5I=
X-Google-Smtp-Source: ABdhPJyJUmY4cuZ/bYuBxPB7/aTUkrncJRnI7ZEDL9i6xSU71lycPvci4ZQssT9MWj/uBiKHGegkItt395XnRD+8J2U=
X-Received: by 2002:a9d:7687:0:b0:59e:da8c:5d32 with SMTP id
 j7-20020a9d7687000000b0059eda8c5d32mr20656220otl.77.1646345184764; Thu, 03
 Mar 2022 14:06:24 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:06:24 -0800
MIME-Version: 1.0
In-Reply-To: <1646300401-9063-4-git-send-email-quic_vpolimer@quicinc.com>
References: <1646300401-9063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646300401-9063-4-git-send-email-quic_vpolimer@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 14:06:24 -0800
Message-ID: <CAE-0n51mFD0JfxxEHOxj=mTFYV92Cc0JDzEY2fxKn6OKOwjq+g@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 3/4] arm64/dts/qcom/sdm845: remove
 assigned-clock-rate property for mdp clk
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
Cc: quic_kalyant@quicinc.com, robdclark@gmail.com, linux-kernel@vger.kernel.org,
 dianders@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Vinod Polimera (2022-03-03 01:40:00)
> Kernel clock driver assumes that initial rate is the
> max rate for that clock and was not allowing it to scale
> beyond the assigned clock value.
>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
>
> Fixes: 08c2a076d1("arm64: dts: qcom: sdm845: Add dpu to sdm845 dts file")
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
