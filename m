Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 700A7543DF9
	for <lists+freedreno@lfdr.de>; Wed,  8 Jun 2022 22:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D8611A0D6;
	Wed,  8 Jun 2022 20:56:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F62E11A101
 for <freedreno@lists.freedesktop.org>; Wed,  8 Jun 2022 20:56:51 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-edeb6c3642so28773422fac.3
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jun 2022 13:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=v7Nak7X+2PmTexgwbA2pTmn1vNdtzIgIfHNl64wkMKY=;
 b=mEzg4mxTna9YIc14kLmTZ96iT6nIeloTFrcrRA9gSf1SA66PLSTZuK0mo/54Moy1KX
 tcQBJ2f4ayMmDWuYEqxChHp/Qbz0mZhjKJhth7KTWDw5iMz/fYXzOWys+JLTZzciGqDy
 p00Km0Ma13AYbY9AgcVdR9H33r37rOt01y91g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=v7Nak7X+2PmTexgwbA2pTmn1vNdtzIgIfHNl64wkMKY=;
 b=7mRe+btnDnBRLXQ3ybz0VW65zPYzMcVaZyuuYFs2tYexaKDd/3IwiiRpDmKleaVyqL
 WLpqcydiYHnu1kpJxyXS6yqh4a0bLT9gZkKs0erFAkIxc5KxKies/bTpCBiKHQbXimU4
 Vx/vIeWdAqUrQhPHOtP+QyCenf6rztbow4qsSKq7tZYCvWwyhoPJRbgLewraUN1734dX
 6wWuXDJa46WfrnV2pTEYFuBXeALF6Xv+HirC37Gf6UnOKefGhJ37NR7Pf2jtaC+Yo98h
 T2CWoxFoHRtOH8/iR2lWIkV3NeTu8YGM2VQo85xnKOuis34YU6TZh5jBaDzKpo9vtHdY
 r9AA==
X-Gm-Message-State: AOAM532uVcLjGszeLKTNyS5pUcrtisA3ju0S/Kc37cPRQs8ZJl37I4EY
 DlflMIgokJMBQ2FR26MX57TP6JG156e8eTON5MITBA==
X-Google-Smtp-Source: ABdhPJxabmpsfSGW+bvn77sCFVrRP3NgpCd+ghOBpTDAkTie/k6DjxTP2EftIQ8wF8o2G0mJU2Xaer735XNxODj6Ncw=
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr3368428oap.193.1654721810576; Wed, 08
 Jun 2022 13:56:50 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 13:56:50 -0700
MIME-Version: 1.0
In-Reply-To: <20220608120723.2987843-4-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Jun 2022 13:56:50 -0700
Message-ID: <CAE-0n538RnLT0KgLhZVfowmWNAmVmSJ3AaJUOCxgsToL6+VmgA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 03/12] dt-bindings: display/msm: hdmi:
 mark hdmi-mux-supply as deprecated
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

Quoting Dmitry Baryshkov (2022-06-08 05:07:14)
> hdmi-mux-supply is not used by the SoC's HDMI block, it is thought to
> power up the external logic. Thus it should not be a part of HDMI
> bindings, but it should be declared at some other device in the DT (like
> HDMI mux, bridge, etc). Mark it as deprecated.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
