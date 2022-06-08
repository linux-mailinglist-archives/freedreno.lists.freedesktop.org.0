Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C17543DFE
	for <lists+freedreno@lfdr.de>; Wed,  8 Jun 2022 22:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38F911A0FC;
	Wed,  8 Jun 2022 20:57:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6CD11A0FC
 for <freedreno@lists.freedesktop.org>; Wed,  8 Jun 2022 20:57:33 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-fb1ae0cd9cso18167981fac.13
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jun 2022 13:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=/K2iqivXQf9yE5saL0neALjx6ioa+JU7B+6RLTjt2Lk=;
 b=HbZeFoAypR4kLl5P2IhNK1+vyg3fWue+ScLLVz4SVhWGHTw4eA6eDB/JVLWJdtN0F6
 Y0pT5gaclN3YpQrJRN3tXejWnJrVnOKzfu74LcRrILBxAjnwamiLZPMQoGMG6DpVfZoc
 /gWXuMoK82UpAB//e1hMII0FZqkU9yd+u37tU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=/K2iqivXQf9yE5saL0neALjx6ioa+JU7B+6RLTjt2Lk=;
 b=WhpH9I/mY/b2JuTH4BwKa+dIgqjap9MBJORZZr3Sit6e2XFUq+OVlR102lu2yoF8SY
 8wazYckqt7RED17JPIAgaW8HvLJRVDwrP9XpFinvAYiaPcYR6ZvyzRhtFtVhp6dF0blk
 BE3SkW7wBWnSjQ22zLZDNaeGNR02lmCCzEfXfiq6lT3O8vmxtIKgmhtnj+za8tGb+EWP
 3Fi7VCNJSCRU60UbcDDiSzvM/RZ6TM9qemVPo+IOPFnSV8KDgCQO2q+aGKam6xZemnfa
 eIxtBWgNxbYOVdEh4FW7VR3jUimDhcFeEiHc/cGEnEt0UEZFyXfbK3xHK1poc5uS8orH
 x9Ug==
X-Gm-Message-State: AOAM533JZCgGz1XjWcZ+vEwJheTMwoDXAYftenSVueA5hZb5LlQZfbos
 wsnUXeyWrCVuWYARMC2S+dY5n615syLN9Ll0S0UU6w==
X-Google-Smtp-Source: ABdhPJy8aPYqwWHnnjU3tUjw8mNOYISWxggIFluFTX6jVgidDeBAC45mzAKJs28IMnTzw9zMAzZyCdfg02u9rO1qNlM=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr1752412oap.63.1654721852894; Wed, 08 Jun
 2022 13:57:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 13:57:32 -0700
MIME-Version: 1.0
In-Reply-To: <20220608120723.2987843-6-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-6-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Jun 2022 13:57:32 -0700
Message-ID: <CAE-0n52XgKVdzokmNBOM_ONAwyVQpu-UQxDgwzXXVMuK+5CJRQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 05/12] drm/msm/hdmi: drop the hdmi-mux
 support
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

Quoting Dmitry Baryshkov (2022-06-08 05:07:16)
> With the last (and only) in-kernel user of hdmi-mux regulator, drop it
> from the HDMI driver.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
