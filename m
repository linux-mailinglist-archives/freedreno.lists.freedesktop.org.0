Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EE49718AB
	for <lists+freedreno@lfdr.de>; Mon,  9 Sep 2024 13:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC5110E3CA;
	Mon,  9 Sep 2024 11:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WTHNLCUc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 070B410E3A2
 for <freedreno@lists.freedesktop.org>; Mon,  9 Sep 2024 11:52:38 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-690aabe2600so37381657b3.0
 for <freedreno@lists.freedesktop.org>; Mon, 09 Sep 2024 04:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725882757; x=1726487557; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MMtCp8ATO/sOcs10GHw7/+crLwD+Hw8l41IBIY7otQg=;
 b=WTHNLCUcEzAa1CswrtOHAxywkOSFNVphByjW0Hu797PQlG9HoPyP7gsCX9izJeWPjt
 GgAvBGIJhoQMbZnz/DtYIhcsN+8gnoDGCm7BFov78stI0x6oPOiwX9jaHLN4OCCFbzjY
 v2rYcBPpkqIUxIdKvjenWyYTaDxpmJgGXV1uGp0ELsqyirA11CnYSLdqkaQrx2ZTxe1o
 ARUQ+fQ/gGgH7dZ2R4PxORE5tGBd9TNdF91LfmQTTGWMpmLCNGL9v+wFoU/t3GnIwYbW
 bmuygu3axLctGSzLzMlz1l3g9Pbxk+kB994aV032rHMyp95MRGYIkDTyLAOnarJzIVOp
 f56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725882757; x=1726487557;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MMtCp8ATO/sOcs10GHw7/+crLwD+Hw8l41IBIY7otQg=;
 b=vJ1oHe2I6H+cSC+h3vhKPDt5mi/XTQ8FZSKU9+vN2pxIaFWTLWK7oTCq3cmrkmdG5x
 GrIHwNKcgoyX7o+EisI8c/770WTObMRwyAi7s0sRtUMlpSh31tv20gPw/ODhQFG5V74j
 rvf88TDzNYagPHCCNuMP3ilgXGmTkGhOIpIgP1r0q7GXxcoFJG/pUujOMNQuJPLzIgA2
 LQVZ7QIqoTBIZ0ffqUxQuTmjObRdNGAvK6m/lFA5JBim4HH6DK1GesEZlpew7okPSC+f
 oED/uV0miuH8lOttHQWkWXEp2+xZnTB7ZeMmt3S6oiiC6dbKSqzZZeJBU017mbn2nvRm
 bhMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVKSV3597cfLLwQpTMb61VYZRdKz/JBiBi2sgSsWHXnAVWULQ/31k2JWEfqy3cZ6IsXME1BF5dqqU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpLcKk/MknEkE369QuS12BRwKwg+ZTfTclnAiHZwflmq/i4kpM
 0RlSrjXjAFjJMKBhNoyzPCzTFWCjkExuwS0yFDmlfGWOVqCUuHc/+cWhXgWP+G4YDwHCn+YGQ3k
 bI1O79UKZ6D0KdLj9F1L09jDTjy4OXBmrkSeq7Q==
X-Google-Smtp-Source: AGHT+IES2R/I84SVypbTZHwAb2uGqV81o7Zid/P12Fyb+DQeCila7SGmdEBvAwfhacegWh9dEh3FskbNOuYzbfjbpH4=
X-Received: by 2002:a05:690c:113:b0:615:1a0:78ea with SMTP id
 00721157ae682-6db4516cc79mr112532817b3.34.1725882756938; Mon, 09 Sep 2024
 04:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240908-adreno-fix-cpas-v1-1-57697a0d747f@linaro.org>
 <c77ab7a8-49aa-447b-b7ac-18dd5c2eeecb@kernel.org>
 <CAA8EJpr4sMEmywD3qO8co1ZN3jG5w=dsfDYYmY90baRne3dHSA@mail.gmail.com>
 <88c4eab9-0e12-4eee-a04d-110b6228ede4@kernel.org>
In-Reply-To: <88c4eab9-0e12-4eee-a04d-110b6228ede4@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 9 Sep 2024 14:52:25 +0300
Message-ID: <CAA8EJpqUAYuUrsijSs0Ncy+KT8KsjpXWMb92aZVhf=Ub_c-9iA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: allow returning NULL from crete_address_space
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 9 Sept 2024 at 14:29, Konrad Dybcio <konradybcio@kernel.org> wrote:
>
> On 9.09.2024 1:25 PM, Dmitry Baryshkov wrote:
> > On Mon, 9 Sept 2024 at 13:34, Konrad Dybcio <konradybcio@kernel.org> wrote:
> >>
> >> On 8.09.2024 7:59 PM, Dmitry Baryshkov wrote:
> >>> Under some circumstance
> >>
> >> Under what circumstances?
> >>
> >> This branch is only taken if there's a .create_private_address_space
> >> callback and it only seems to be there on a[67]xx.
> >
> > Existing code doesn't. I stumbled upon it while debugging private
> > address space translation. And that's why I wrote 'it might be
> > required' rather than 'the function returns'.
> > So yes, there is no issue with the current code. And at the same time
> > not having this in place makes debugging more difficult.
>
> Feel free to submit your debugging code in a way that won't mess
> with non-debug paths then.. This is trying to solve a non-existent
> issue.

Ack


-- 
With best wishes
Dmitry
