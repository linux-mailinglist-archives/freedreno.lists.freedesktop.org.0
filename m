Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D297118FD
	for <lists+freedreno@lfdr.de>; Thu, 25 May 2023 23:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C5010E775;
	Thu, 25 May 2023 21:24:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD3310E778
 for <freedreno@lists.freedesktop.org>; Thu, 25 May 2023 21:24:06 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-ba81deea9c2so130316276.2
 for <freedreno@lists.freedesktop.org>; Thu, 25 May 2023 14:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685049845; x=1687641845;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pqBKWrOrEI+zbEK9OlZBpSdzBnSQCmjwQcZsxLNFq34=;
 b=Keu12C8b9pEdKe7GwX1dC9eCui1aDDVD+Q7tBnATclYFz7PoRomFtL2TdFCKJy75V9
 Hi1CCszSwVsyuNWuX4NeEl1tRgpVVDcgZHZDYxo5cTbyIBCH4vfte/K7F8lkInEL0Ceq
 Ta5bQOVbrutBQ+Cn+AuDpKlsna5sjHxsiwrIgyhpFlZvSuYy+veNQ8v4LtCrl3Qli40A
 8EJOmPJMIUtHjIm6IKFb5/OGNBm+CpnqFh6TMYXX1BN/eLJiweBUBOCa3a+Zj9sCdfDF
 MlU0B0fTsFgvIjGuhROYoVLT4Asewjvz+t+UBhPSLU/vcQB458hBCo62xXv3VJFmkM8K
 Eo2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685049845; x=1687641845;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pqBKWrOrEI+zbEK9OlZBpSdzBnSQCmjwQcZsxLNFq34=;
 b=KFcU5NLub+4c/KWaRcOliMg9CveLUC8cClQyJE8nBQlL+9/zambEcAJG83DFLateHX
 eT9c/QxNOJDDBJG8VEyRqgV9dnoTg2H6PcqfPKQEkGMG+iCuJSi+5OsQn7FMoLXQSAH3
 ec0UceZZ1O4ahZkRm/I5n8XfGvNSlGbmFlSqDEy/NnHK/c1a8DHMHsbO4j32pFT3VntW
 IJxuQSzZpI+1kkWstYd0Zc08TPyrxLBSG6+uo3lSfNcNBkFj1i6xqYsKsR/osOlNeB1T
 5ywEAlwTkS5c8KDQWIHFJ2eEDxHogsJRZqtRWM8khnjzep6e8+UtEE3xBMmQWABO3F3w
 0WmA==
X-Gm-Message-State: AC+VfDwarVBh/5vl3g+K03ASqbgEBaXeiCqSxrxPMe1PRyblenYkM61e
 P5R1GuMNqAXIRKUL3wjyUYgxKZzLzxSQpibtHc6Gbg==
X-Google-Smtp-Source: ACHHUZ4YstKIvO4GH8WsZOBXogGoInnhvvSgR7JQOxu5XIhdLUFoqTlzHFOoauc8qgBelFTIZtCQ3uOGwhBuI8EBMIw=
X-Received: by 2002:a81:8341:0:b0:55a:8226:6192 with SMTP id
 t62-20020a818341000000b0055a82266192mr1061968ywf.7.1685049844900; Thu, 25 May
 2023 14:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230329-rfc-msm-dsc-helper-v14-0-bafc7be95691@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v14-3-bafc7be95691@quicinc.com>
 <7e5axjbnbhtdbrvtpcqnapp3p2xe2ekgj3aizssps2zesfhs22@trhwxetiif7p>
 <7ed799fe-1f0a-3d14-3244-7ca351feaf83@quicinc.com>
 <czjefqca2ye4ntnqw7smy5uiyle3hxnhsxi3so3z3ezigejikd@imtsdfvgr5p4>
In-Reply-To: <czjefqca2ye4ntnqw7smy5uiyle3hxnhsxi3so3z3ezigejikd@imtsdfvgr5p4>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 May 2023 00:23:53 +0300
Message-ID: <CAA8EJprrwnaXXstJmH-jSXZP-XiPA74reZU40+q07uTCjjav-w@mail.gmail.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v14 3/9] drm/display/dsc: Add
 drm_dsc_get_bpp_int helper
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
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 25 May 2023 at 23:18, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-05-24 15:38:23, Jessica Zhang wrote:
> <snip>
> > >> +  WARN_ON_ONCE(vdsc_cfg->bits_per_pixel & 0xf);
> > >
> > > You did not add linux/bug.h back, presumably because Dmitry added
> > > another use of WARN_ON_ONCE to this file in a previous series and it
> > > compiles fine as the definition trickles in via another header?
> >
> > Yep, this compiles fine without any error or warning.
>
> Yes it does, just curious (CC Dmitry) if that is expected/intended: I am
> not familiar enough with the current header includes to say for sure.
>
> Dmitry seemed to rely on it already being available in
> https://git.kernel.org/torvalds/c/2b470e5531f57c1b9bfa129cca0ee17a2ecd2183

I think I did not care about including <linux/bug.h> I checked that
current set of headers provides WARN_ON_ONCE, that's all.

> but that could have been an oversight?
>
> - Marijn



-- 
With best wishes
Dmitry
