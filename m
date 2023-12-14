Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82942813AA7
	for <lists+freedreno@lfdr.de>; Thu, 14 Dec 2023 20:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9943E10E22D;
	Thu, 14 Dec 2023 19:23:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C24A10E256
 for <freedreno@lists.freedesktop.org>; Thu, 14 Dec 2023 19:23:01 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-5d2d0661a8dso85783537b3.2
 for <freedreno@lists.freedesktop.org>; Thu, 14 Dec 2023 11:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702581780; x=1703186580; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yG7suejrqRA1mYwSLTmp+LIk2/7peq/L7UWtxNt32fU=;
 b=xvb2k9saArVCNtSTJ40HcV9j8qOzEBw/rTAHDpDU1md7R25NS5kDY7FFsE/i+ES5IM
 tRo6X7I+50AuWMd54u+WtW0uQ1418eENNBU7qLiJSsirFCsj+m7LQO+fGBDFfgBowrn8
 xDeGopKPZHgMtERj0OuY6aQoGO0V8OKjw1YCLdfiSvmWIFeGl86uki9n4N+HM9Td2L87
 8l822RLUyvkNbFISt4RwmS6IF10VNEOSVYnoKLrNilfJPPLpIcQEh31rAeRpLuDZDlQI
 Wo5DyCZSZvUjWminpRDMtC/nGyLqJEXZd/5LvNpUjFmubMYb7UYwTnmZoy8DsfLIDr6H
 gZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702581780; x=1703186580;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yG7suejrqRA1mYwSLTmp+LIk2/7peq/L7UWtxNt32fU=;
 b=sfUgV31zEoW7VusOTQkwe6Z96vDTObgaljLZzkCgGrc+L/M0p2U7vSY8UfdDGS04c/
 yqFkeHcddd/lQ0ub6B5l52NTAW/Mb7mnQ8EZfSNjiJtW60sLNMmOuDxGawKSIQOa580B
 0gxehJVknY9J42dDCwq4oZvZWyMjtEuK/gcWFcaeQzmqMhziMI6sc3cfAUDH/bi1BCAo
 MvyKSGbPxk9oAgcWTyDc08FnGoPwK+0mvfgnmqYeloF8oAH3sog+NzMGy144xpm3QfpM
 8H9ESysBHCr+w+1h+6JewTsCEkrLOfDhadCbqPXMDg5vmbQNKNfw6wuV3cbIH4W2xyW8
 JwBA==
X-Gm-Message-State: AOJu0YxUAynNBzn1lq8UfA4zN4aEYJb9JK1hxTgSxzeCoY7QdUm2FDzG
 raD7zB40Dr0NhJOuHnpknPKezhf1E8nAHc3j1o2tyA==
X-Google-Smtp-Source: AGHT+IGHgEYjjKO+laGz9YkrYFuIJVcK8YCew+uKOMkZmZYgNxF3CHdtysJHXl6PvN6SIOfG66h1mq9QwrAZVits0sI=
X-Received: by 2002:a0d:ff44:0:b0:5d7:1940:b389 with SMTP id
 p65-20020a0dff44000000b005d71940b389mr9313100ywf.85.1702581780647; Thu, 14
 Dec 2023 11:23:00 -0800 (PST)
MIME-Version: 1.0
References: <20231211154445.3666732-1-dmitry.baryshkov@linaro.org>
 <20231211154445.3666732-3-dmitry.baryshkov@linaro.org>
 <6f3c4692-ac87-4852-9a60-6df64ad8a803@linaro.org>
In-Reply-To: <6f3c4692-ac87-4852-9a60-6df64ad8a803@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Dec 2023 21:22:49 +0200
Message-ID: <CAA8EJpoVXs4SmcwAwG57ii+C5j=W=z59XBdBq46eacG=njiEag@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] arm64: dts: qcom: sm8150: make dispcc cast minimal
 vote on MMCX
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 14 Dec 2023 at 20:17, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 12/11/23 16:44, Dmitry Baryshkov wrote:
> > Add required-opps property to the display clock controller. This makes
> > it cast minimal vote on the MMCX lane and prevents further 'clock stuck'
> > errors when enabling the display.
> >
> > Fixes: 2ef3bb17c45c ("arm64: dts: qcom: sm8150: Add DISPCC node")
> > Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> Only patches 2 and 4 made it to me..

Hmm, interesting. I'll resent them.



-- 
With best wishes
Dmitry
