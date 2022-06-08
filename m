Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8DC543E10
	for <lists+freedreno@lfdr.de>; Wed,  8 Jun 2022 23:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208B811A1A4;
	Wed,  8 Jun 2022 21:00:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C4C11A1AB
 for <freedreno@lists.freedesktop.org>; Wed,  8 Jun 2022 21:00:25 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-e5e433d66dso28763380fac.5
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jun 2022 14:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=RfojhM+HvhoFUnCUYXubG1c+YnDVOjxUgDJWQ5CNrD8=;
 b=Zbg5T0Ft2Qyes3tF93Q6J0IzPyCQhYKtIWw0jw6DstsqqYQV1A/dk+2CMasNFSbRvB
 4c0u2mufR0ywsmnFBOkHTL0n5Fg+v3ZSb40aysn12VBT5NzbFrfKUHDL/jQZXUw23KRE
 qt5+O6JXDBXfWdg0zBNwFvXEibj0LTQqci6zg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=RfojhM+HvhoFUnCUYXubG1c+YnDVOjxUgDJWQ5CNrD8=;
 b=VqFaI6JRuCLcxhr5jvX1+JeqFhwFmSZ8HonDgtxNjB7y0GACaasWIKUYeOvzxBgGus
 kHk67k59Ev7gnh+k8G3p2D/UShij1Bk8smspu88X9TFpYa5REFsOSno22GWrBw1upTuN
 Z3CsmcRtVyzfVuv7g8AFjE0pY4YyR9Ii/a3qHTqHWFzOFS+E8VRrEczToyyUST6XAhrk
 8V0WU5nSmoVTWGX/wgxnWi/JrLFkjYhMJYSykt3CS2NxOleRWR7hL14fNdWZKokytE6R
 Goey6HKHM+Jbvz4mnrL9zEnjXhQj0mcLKBPMaohED1yFB7vHIsrKEWPS1coxGTboHyWa
 n5QA==
X-Gm-Message-State: AOAM533R5zHc4HECQrWUXFCNofW0fI/RJf0uzivvw/0ozFAdjDpTW4dn
 JxWfml3vDWFGU1l1bYrejIEcZtWr1Gpju4YvDBnUHA==
X-Google-Smtp-Source: ABdhPJwFBJUEkULzJAaH7LxPz94JppRi9Mr0BKxOSBfhv34a+e+Ti2dPDnik5hKcgov0hA6wVNLtyuNw8WJ6wXaJ0Y8=
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr3374939oap.193.1654722025105; Wed, 08
 Jun 2022 14:00:25 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 14:00:24 -0700
MIME-Version: 1.0
In-Reply-To: <20220608120723.2987843-9-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-9-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Jun 2022 14:00:24 -0700
Message-ID: <CAE-0n53BuO91fZEQzTmhOmNxvdmLBfJaf7cu77FGU5hZgme2RQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 08/12] drm/msm/hdmi: drop empty 'none'
 regulator lists
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

Quoting Dmitry Baryshkov (2022-06-08 05:07:19)
> Several platform configs use empty 'none' regulator arrays. They are not
> necessary, as the code will use corresponding _cnt field and skip the
> array completely. Drop them now.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
