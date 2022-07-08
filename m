Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ABA56AFCA
	for <lists+freedreno@lfdr.de>; Fri,  8 Jul 2022 03:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D74710EFC4;
	Fri,  8 Jul 2022 01:34:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FC610EFC4
 for <freedreno@lists.freedesktop.org>; Fri,  8 Jul 2022 01:34:19 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-10c0052da61so16766998fac.12
 for <freedreno@lists.freedesktop.org>; Thu, 07 Jul 2022 18:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=4V1jJFFBwe0tkM3Ad5Ot/7v9+0qxLzwLjVqs7lYKRhs=;
 b=RHCML0O3BeCec/megjPGrCsRqQ5mbPdK58IEcrU+PY/dNU56gGGgb1h46RpENStZxq
 LhL7qLe4+vgxQ0h08J35HhTUyTqFH/C6E9v+ObEaM0TNh96UOLTbA+gPbTcaI97SKXgt
 7N23jcUWTGzK1fcK2Nu1mavb5UOqAigxH/+KU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=4V1jJFFBwe0tkM3Ad5Ot/7v9+0qxLzwLjVqs7lYKRhs=;
 b=FSROuisxsiJhxhKqTQEb7gSW+SM2JAX8sDcIyaKpU+ZkGIVsLQMOY7wmeAegpaOWAG
 nNDzq8McKfVEUmvriEogFFKYBmRtGvnXzJTuVnwQNwQWt6zvkaFe2JnZHd7p16FxA76K
 k8KB4oKKej1IULySZGVx0ZA0VIpFX+9i5C7NUFIXndNxtU0E5Wrzw4+aH6YWY35i3N7q
 2fRUig5iwvssUn82YyWTYiPZ1v8eaKHXKF3OpVmkVnlkzWtuzVJtV/kkRmkZLKylQ1K1
 kqUdqTwb0LhsAU1dLr0C+DfzN3gt7UEK84C4E5hCC9g4cHI0y+OnqGnWI23WVp/Vp04O
 oI8w==
X-Gm-Message-State: AJIora+C3A95kilJCX8gHVa7PbMiC7syktclCxcHUcHSqo8ejpDVEzHt
 deaq6az791RuU6ElHCTWGMA6yVTq4ZquxUDOkV6u7A==
X-Google-Smtp-Source: AGRyM1uZd+As7N/om9IBZ/Qo1/4OAME0XQal8tqtiWDDQMG8lxaPRcreILzi1QA3h+/OQ1eKkqN1gCUup3mg5cMWJGk=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr545769oap.63.1657243998193; Thu, 07 Jul
 2022 18:33:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Jul 2022 18:33:17 -0700
MIME-Version: 1.0
In-Reply-To: <20220707213204.2605816-7-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-7-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 7 Jul 2022 18:33:17 -0700
Message-ID: <CAE-0n51EA+YQudOwFU0S9OS17gc-iBEDUT3DYYHVbd2G1zWL=g@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 6/9] dt-bindings: msm/dp: handle DP vs eDP
 difference
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-07-07 14:32:01)
> The #sound-dai-cells property should be used only for DP controllers. It
> doesn't make sense for eDP, there is no support for audio output. Also
> aux-bus should not be used for DP controllers. Take care of these
> differences.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
