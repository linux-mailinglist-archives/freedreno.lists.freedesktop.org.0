Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CA89D52AE
	for <lists+freedreno@lfdr.de>; Thu, 21 Nov 2024 19:44:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F58B10EA1C;
	Thu, 21 Nov 2024 18:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ig6nyI6g";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1232F10EA22
 for <freedreno@lists.freedesktop.org>; Thu, 21 Nov 2024 18:44:25 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53d9ff8ef3aso1457066e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 21 Nov 2024 10:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732214663; x=1732819463; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TZyh5R6Jjbt7oN7KVsZQw9ZFXBRvyZ4Sk/f6o54iZsw=;
 b=ig6nyI6gtHUCxE+brUtfZLb0sPdoAHOL2fv1G4okKEI/1F3M0gmpqkrEn/6+kXlQvX
 wGa6CQ4AoW5mdz3a1h/aAZpeOjPecIh6cQtnXA7kAqdsAk9F2/AKChD7vyEdvJAnnOmZ
 WMm/UeH61wugPfDuZiHPnZjRYngwC9Mv/eJzlafGeOdHwKX9N0qlXpRrCUnROt+REYKN
 0hci1ZREy/1zpOia6k52xd9TtiYM0Fd1+u+yqbcRON4cDzFKSEzg8BMjEpcy9HPRr0YE
 WRA84CUdxzNVP/v9L1ZQilKADGpM566AmBsCKOTEbTNjgbON7qhIjsUeV35Hf06tKOpL
 VGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732214663; x=1732819463;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TZyh5R6Jjbt7oN7KVsZQw9ZFXBRvyZ4Sk/f6o54iZsw=;
 b=cW+8aO21bvtKU8ODxyIOT3gpaZrgzzaknLh1dpsjSopeLjTOaxtivpGEz+ndRnWqgP
 C3MVzhEG6oKhWE22NdaRKxpubGEhDBl77uDoewDuN0sXxH2UXIYIqAJGmg2D21aXBfpk
 qd3GFsPnRupOZkYz3VSUlxmpfCBKGUe1r9OtoxpYGdr6aBe8V7N4t/mMLrr03QhDZnZP
 EWuvzGmqQmm6RFfoS8rn+saD+6tpdUk1Molo8EDqUbC3Y7hibJLJF6qZarZRtuOBT1PJ
 zyauqTtm7PQWypo1LsA924fX+VX286tmJkZONpR0BowTOJEbEKuxSH0GvjIV+k7ELmjt
 aFDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1WXQSqpkC9Fs9g34S4Uj4Qo4Zf0i0vHrfv1niEXveoPjRnx7ZMBWzf+/x2TTHXz8ZDeJyodvKEl8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGl58NOFFHVpAbghWLz8sk2Y16q/8mmj4IwKhSqXbBSfcqxYcq
 SZWBuTx4d6N+4oLJCbi8Frfa3TZXcr/4Wor/gKNLlU87Ll0CDxdkOhNRrtjMxYI=
X-Gm-Gg: ASbGnctNd4fkukMGQZq+RLLtB+l+uZcKvL8hCKcKJwv+NKe3kCWYuZUoz3H0PLbfaE4
 MvS5QDjgRdQ9UiR9dxYmOb13l4zOcAOY91/sxkfxUKml5suJ//bycy9aQJeEs0fWGwYPBdgNU9i
 rD7/7OdEjbVoQwT0ZVGbum2W+fHE42Lm+4oN8lCsK3qrly9avZxG/3iauQnkTSD1c/dQD+Ssbe5
 RS/uBZz5E3E2kwdmAUwW5KXvS9CP8iMXQgPJ+Mv/nnoOBW33XJn2ITuvwUZml8/80slaWpf86bP
 2WoXHnr9TGhkf2SPeHXxMBmKKPoJxQ==
X-Google-Smtp-Source: AGHT+IG7nxOfbTTnTu4v1sr9zkOK5csQupd0P6YOCsdv1of5Sqk8kO39dWTULCj7D8rgDzFjdACzwA==
X-Received: by 2002:ac2:430a:0:b0:539:adb0:b91 with SMTP id
 2adb3069b0e04-53dc138a1ffmr3344284e87.57.1732214663097; 
 Thu, 21 Nov 2024 10:44:23 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2496a37sm43307e87.234.2024.11.21.10.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 10:44:21 -0800 (PST)
Date: Thu, 21 Nov 2024 20:44:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 03/11] drm/msm: adreno: move features bits in a
 separate variable
Message-ID: <dtt6d427u5yep3i3b3zxxef7uh572aeu3vtatmjvpbqfpjbvjc@epkkr7oumncn>
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-3-4deb87be2498@linaro.org>
 <fkezpguictntg2wkouwqipnaaiauo6vu46n7a2xzvlorzvyeaw@bbcpj3bs5eko>
 <CAF6AEGs6zT_kaTXNohUaA7KWZxZTr4byaoMoLAceuyqA7S+2CQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGs6zT_kaTXNohUaA7KWZxZTr4byaoMoLAceuyqA7S+2CQ@mail.gmail.com>
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

On Wed, Nov 20, 2024 at 10:54:24AM -0800, Rob Clark wrote:
> On Wed, Nov 20, 2024 at 3:18 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Tue, Nov 19, 2024 at 06:56:38PM +0100, Neil Armstrong wrote:
> > > Now the features defines have the right name, introduce a features
> > > bitfield and move the features defines in it, fixing all code checking
> > > for them.
> > >
> > > No functional changes intended.
> >
> > I think it might be better to squahs this patch into the previous one,
> > it would simplify checking that we use .quirks for ADRENO_QUIRK_foo and
> > .features for ADRENO_FEAT_bar.
> >
> 
> IMHO better to keep this separated

If they are separated, it is easy to overlook presense of a statement
checking .quirks against ADRENO_FEAT_bar.

> 
> But we don't have _that_ many features/quirks so I don't find
> combining them all that problematic
> 

-- 
With best wishes
Dmitry
