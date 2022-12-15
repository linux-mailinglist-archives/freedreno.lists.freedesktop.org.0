Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6894164E228
	for <lists+freedreno@lfdr.de>; Thu, 15 Dec 2022 21:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AA610E561;
	Thu, 15 Dec 2022 20:10:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CAF10E55E
 for <freedreno@lists.freedesktop.org>; Thu, 15 Dec 2022 20:10:11 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id f20so120800lja.4
 for <freedreno@lists.freedesktop.org>; Thu, 15 Dec 2022 12:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=hIS0EaGXTjCRXER8GI+dNLF12wjq2q+2o8WGX76WmuM=;
 b=AZZq5PUnZFfrNHwv7HNiSHWCLeR7RR8le4981nYRfDcS/ru+GZCfjF9myTcDec3B82
 mQ2GZURB0mLaYbyVBtGJ1NFHjPo+S8Ar/iMl/x6SnWZIdiR5UPHYRSs5fzuQuqgP3aaO
 fSc/9GAnzacM7M1X/ZpuSegZbsPHV8l1Y5Xms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hIS0EaGXTjCRXER8GI+dNLF12wjq2q+2o8WGX76WmuM=;
 b=UWMstL1xFFlxM3T5G1VaajXRty1uPpUTOa+pQtvV3FxVFjAE/C4zLI8sGb7Kf5Ahtx
 eCLk78zkwv/xxmqjq/R+AIvPQquhSP0goigOOBw0uQ5Ur1AnNv7f6+y5fqUSOdzY9fwt
 GFLZwFvRYdhI6ZCcTw0IZXAU8ZentSUzvzAXNnqUwB6CAVNDM+7sH0FsfPvwKT4AVc5+
 pPcAB8mvtaQ5P7ovJT3+maZpjHLTlhkY8yIHpE4iu628CxEecEi8GctcGpMowhf3+IS2
 5Dukstt4/TV/vBIMNNClnEU2mSM/t9ZzKnxqI9WWzAGE0pbR+ltfU0dktBgO2qVoPlwn
 pBlg==
X-Gm-Message-State: ANoB5plTdkQIcGIMRcvvobUdCiKi/0NKrD0kip5yvBXEegV+tKuUTAOK
 pMelQ+wokJ/YAPLtVpWsn84IRuEmbEsjSNaTZTc5PA==
X-Google-Smtp-Source: AA0mqf4Tx6gctjKCY4dC7SXXC0K/mpFF/gMRMqZIcP3KQUC32WpR7lr/tv9LCeuvBxDdF2/qWtwf4i+PNBpUR6inRKk=
X-Received: by 2002:a05:651c:221e:b0:277:6231:5a7 with SMTP id
 y30-20020a05651c221e00b00277623105a7mr23597850ljq.300.1671135009730; Thu, 15
 Dec 2022 12:10:09 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Dec 2022 15:10:09 -0500
MIME-Version: 1.0
In-Reply-To: <ca15a54b-8040-5e4f-a78e-12b7f8a554e1@linaro.org>
References: <1671129159-31105-1-git-send-email-quic_khsieh@quicinc.com>
 <ca15a54b-8040-5e4f-a78e-12b7f8a554e1@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 15 Dec 2022 15:10:09 -0500
Message-ID: <CAE-0n53bREwEMV4aP=ySPuPP8mMbDr=Unbjw_bW0MNN7hTsWRw@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 agross@kernel.org, airlied@gmail.com, andersson@kernel.org, daniel@ffwll.ch, 
 dianders@chromium.org, robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dp: do not complete
 dp_aux_cmd_fifo_tx() if irq is not for aux transfer
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-12-15 10:46:42)
> On 15/12/2022 20:32, Kuogee Hsieh wrote:
> >       if (!aux->cmd_busy)
> >               return;
> >
> >       if (aux->native)
> > -             dp_aux_native_handler(aux, isr);
> > +             ret = dp_aux_native_handler(aux, isr);
> >       else
> > -             dp_aux_i2c_handler(aux, isr);
> > +             ret = dp_aux_i2c_handler(aux, isr);
> >
> > -     complete(&aux->comp);
> > +     if (ret == IRQ_HANDLED)
> > +             complete(&aux->comp);
>
> Can you just move the complete() into the individual handling functions?
> Then you won't have to return the error code from dp_aux_*_handler() at
> all. You can check `isr' in that function and call complete if there was
> any error.

I'd prefer we apply my patch and pass the irqreturn_t variable to the
caller of this function so spurious irqs are shutdown. Should I send it
as a proper patch?
