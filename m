Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 570484C99D0
	for <lists+freedreno@lfdr.de>; Wed,  2 Mar 2022 01:24:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3D410E1B4;
	Wed,  2 Mar 2022 00:24:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440DF10E1B4
 for <freedreno@lists.freedesktop.org>; Wed,  2 Mar 2022 00:24:53 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id v5so50041qkj.4
 for <freedreno@lists.freedesktop.org>; Tue, 01 Mar 2022 16:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zf2ULn0elai1DQP6DK4nPbrJ4hgulzfjwpA+B07Mye4=;
 b=Vaxfzhe5jRSu7pBxU/9C864q1lnnA2SgZ58NAG4fQYy7kuZfQIsa339XAguSx8eRza
 DrNpLkLts46hPPsCfr/Ag9tcOvBLRdLVA1+aCUDNZVAk+3GxowkInx2wERDpBw+8MNeD
 Uk711xHciJjdZrnOlFSve9+CRRkv2ybLhofRXbqfgajOvSpCtSyi1p6D8+cdBkzdGYaZ
 K6e4KnLqF5bdOC0OloeF2kgtS9AEoM1t2rQSQnfdmcmlWyJRb9qtcuDhTGqVsz2ZW1KL
 9t+rFhEDWsbE56oGhG59Ys6J8ZhiVrXAgCH/DR/5vXEU67SU6aJojTWJZozIlm6QlMI9
 PjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zf2ULn0elai1DQP6DK4nPbrJ4hgulzfjwpA+B07Mye4=;
 b=JxPQUv4JwC+ouoYrz9imL0Ou0q8H2UIRGv3Pj21xuFfIEEl/1aIN+knpRJiRIJh9bQ
 ff40Sv8BugJ+9yg3AcQVNaIWCXk9X7Wk3Lo9BkPt9pP2IyqPlMwImVrh6GpupF+Lh3zS
 Pj4TYxvks7+WA7pEf8P8YwzdBpgp7bel7k5zr7Bd/NQpxAa3YKgp+PLW1sSoDODgtvZu
 tDSQPiEvzDeoZTMOTE92IWrMYypuehWu4r1hodnnoJe2J0Ipp2W/QUT8lzFDpFsXzmWQ
 x+IgaZD3JuTbWb1x4bd3j7YImTExf2L/X2mf35vW5JgfV2l+xATHmjhEOWVgL/txAkzW
 +3jg==
X-Gm-Message-State: AOAM533i6lMo1MzDoEWdd+kZu9DE2MDFBXW4J2KWq6+L8BG8J0/2K0kL
 3ZL/310RJVNATXXPUI1qahuzQnmOKwGWAkgPh+UrIw==
X-Google-Smtp-Source: ABdhPJy7pua4Isz2AeTn/110l78HrRyd3wHGQp0SFekEFMbjXORFyFMGDeo8frJ3QUcf28v/6BObspZkZXX39859Y4M=
X-Received: by 2002:a05:620a:4307:b0:507:d5b1:f65e with SMTP id
 u7-20020a05620a430700b00507d5b1f65emr15137243qko.363.1646180692367; Tue, 01
 Mar 2022 16:24:52 -0800 (PST)
MIME-Version: 1.0
References: <20220302001410.2264039-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220302001410.2264039-1-dmitry.baryshkov@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 2 Mar 2022 03:24:41 +0300
Message-ID: <CAA8EJpr9e2-wz0Hmm7joqOMmAL9asiv4_od+WhS=3Pzs2C9fGQ@mail.gmail.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RESEND PATCH] dt-bindings: display/msm: add
 missing brace in dpu-qcm2290.yaml
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 Rob Herring <robh@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 2 Mar 2022 at 03:14, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Add missing brace in dpu-qcm2290.yaml. While we are at it, also fix
> indentation for another brace, so it matches the corresponding line.
>
> Reported-by: Rob Herring <robh@kernel.org>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Also
Fixes: 164f69d9d45a ("dt-bindings: msm: disp: add yaml schemas for
QCM2290 DPU bindings")

> ---
> Didn't include freedreno@ in the first email, so resending.
> ---


-- 
With best wishes
Dmitry
