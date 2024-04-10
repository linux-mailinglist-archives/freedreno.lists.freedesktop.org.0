Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CD68A01C5
	for <lists+freedreno@lfdr.de>; Wed, 10 Apr 2024 23:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670A310F201;
	Wed, 10 Apr 2024 21:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YgOJpPPw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBAA10F201
 for <freedreno@lists.freedesktop.org>; Wed, 10 Apr 2024 21:12:12 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-516d09bd434so8006687e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 10 Apr 2024 14:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712783530; x=1713388330; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OZwBCycYY1wJMLbUlMdwvYrZmhATN/7bkb8wxUzPusE=;
 b=YgOJpPPwYtKWf3/480jRSx4ZKeaEoe4D7Jgk0h9Cszo6OIZ5MzVUmfTuhDrzaFJWfz
 3sl6UcOO705x+e7M9xFAh5sFAMpdXaLN76qU/oyo/QqX4tm3eyTZ/7YCAAcYn7M+Z7MT
 q41hHXttPdFlOiVYwc1pHOs+ovL3vEFVbIOdEHamj0rGYs9VKV2eUu8/mbEEiWi1GHDw
 uoeRlgrqZ7BFPMTRVuFhjzs5+embMCvS1sOYkAKTbfl8Gm1UHGYojukvfo6XfFxriC84
 ZCl4bmTDt6kG/S1yN8Ry2ffUNwQsBKqCN50y/VKrVgmMXHMwU3TaLtJOZKdis6c5j4TM
 H1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712783530; x=1713388330;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OZwBCycYY1wJMLbUlMdwvYrZmhATN/7bkb8wxUzPusE=;
 b=cyWoNEGK8jG03b/YjznJZH36uflWyrZr0k0z4ZvS2MlgPOyqzZaJ3VHDNnhL0aEKc7
 FyDE9CsDykL2ImesmTPO3UVazKIJvZFfUi9CWVa8GADNa7z5kLeuwXk/FmlYj7Kj+L7y
 BPMpsW/NM0EfqKeR6xWitR6WJ2qtk6XThKApS0VpxH/BX368JSQXV+7+R736h8J1jbz2
 FLRgz7QiCiFEzIV2C40FU1GS9UDNaOttfYDGyWSjzappqWhO8X3zYJDWqewJ0fznH2/C
 N+1M6ByD2jntnqOPWTXbwGYqV8HgVrgHsEozesh3bkalerfWlowkZ9NWGV7lfze0yjmj
 r6ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgN99bKnHHlg/gEL5kZnUiyjaelEn9692Df1Yzj/MW/8TkN6kOdvPlfpD/qyrX1/szoprEwB8vocKqDQ6h1Uc0Kf1qXlujMcUd6V9f1WK5
X-Gm-Message-State: AOJu0Yx2m6fokVJl2S++KID32NoLJEsiaWNN99pf/JcY2RBnxe+rpfNG
 36sSl1QMqx5oJFxlkg/MHh1NJ72beJisXNlkEoAg4BMnl+8psWOR3kV2tjkZhNM=
X-Google-Smtp-Source: AGHT+IEv0hIWdS315GVXqNlHspgdO9aknWPbaAxmVCl0KLCNKAOV5VVBeSrBTsG/U7qRHbDAMlS2DQ==
X-Received: by 2002:a05:6512:481d:b0:515:d326:9e0c with SMTP id
 eo29-20020a056512481d00b00515d3269e0cmr2098229lfb.3.1712783529985; 
 Wed, 10 Apr 2024 14:12:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 i26-20020ac25b5a000000b00516d05bb083sm15550lfp.206.2024.04.10.14.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 14:12:09 -0700 (PDT)
Date: Thu, 11 Apr 2024 00:12:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 03/12] drm/msm/dpu: use format-related definitions from
 mdp_common.xml.h
Message-ID: <uhyqwsevbgvayqf7ky2tasvutpqgvuaa5o7y7scqete3jueuhk@zgji4hgmh4lu>
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-4-dmitry.baryshkov@linaro.org>
 <bb448864-b974-55ac-4709-ea89bbd2694f@quicinc.com>
 <CAA8EJpqnjY35RF52yJ8gFRKHoh1ArnnviacDtfntSYZdALD3bQ@mail.gmail.com>
 <83b45b20-fb7e-564b-4e32-2b6a12c4dc6d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83b45b20-fb7e-564b-4e32-2b6a12c4dc6d@quicinc.com>
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

On Wed, Apr 10, 2024 at 01:18:42PM -0700, Abhinav Kumar wrote:
> 
> 
> On 4/10/2024 1:16 PM, Dmitry Baryshkov wrote:
> > On Wed, 10 Apr 2024 at 23:00, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
> > > > Instead of having DPU-specific defines, switch to the definitions from
> > > > the mdp_common.xml.h file. This is the preparation for merged of DPU and
> > > > MDP format tables.
> > > > 
> > > 
> > > Adding MDP_***__ usages in DPU driver is quite confusing.
> > > 
> > > Can we align to a common naming scheme such as DISP_***?
> > 
> > No, it's not something display-generic. It is specific to MDP
> > platforms. In the end DPU is a continuation of the MDP lineup, isn't
> > it?
> > 
> 
> No some aspects of the hw are completely different as you already know
> between MDP4/MDP5 and DPU. Bringing back MDP usages into DPU does not seem
> right.

MDP4 is different, it's true. But there is a lot of common between MDP5
and DPU. Frakly speaking, I don't see an issue with using the constant
that was defined for MDP5 for DPU layer. Especially since we are also
going to use mdp_ functions for format handling.

-- 
With best wishes
Dmitry
