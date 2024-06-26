Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 140CF917751
	for <lists+freedreno@lfdr.de>; Wed, 26 Jun 2024 06:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E0110E072;
	Wed, 26 Jun 2024 04:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p1yU7Uxg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E414A10E24B
 for <freedreno@lists.freedesktop.org>; Wed, 26 Jun 2024 04:31:29 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ec1620a956so75357671fa.1
 for <freedreno@lists.freedesktop.org>; Tue, 25 Jun 2024 21:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719376288; x=1719981088; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qDMOY6eglp03mIp9Xp9m5yyz1aKQNtppCZRvZo0tS5E=;
 b=p1yU7Uxg7TtIkMYf4OtFV/Tqjna22bp5dMKP8db7zVnCBVhNXAfZ9so+lH1oiarHhE
 4CIDl92nAE86h2aMbXKTErCJDQUZAXtsQKc4i5nVjiGPhl5Zuj8fZZr6RLIThf+P0787
 KxaE/Kix322Wr++eQs5jpWsQM0IHxcTay5la1RWHd5ngoT3AxC77pnlFxWYZSSfsonry
 5++CTpGoFXQyv3eGfbPu8lZGEO23bTlhPRIkWBifN9r9KqCvFBNApN4d+4OcFG2hMfSh
 7iiSFUKSrzQv/YiD7zqzns4CInV5DbpnDYAz+yIcus+h4mduYLgOlxvHcLK+4HZNqu59
 Q15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719376288; x=1719981088;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qDMOY6eglp03mIp9Xp9m5yyz1aKQNtppCZRvZo0tS5E=;
 b=dWefnMmLui0/iLh/vVP+SVgriKrPgbs0Rn8V5MimNS0AWDnYu8hPJ4nmJxyrUWALYl
 RuLKcVmFoUJ6Fcake1KMIED7Vy8Exp03EN68sIRxr40Tsx3jYYvd/DSakPu5Tdbiv2dh
 aoAJBq50B3BPEyM6R6Z1hc9pQ0J9DeLaUy7moMH1XJdOVS8j6rAeqZHn/eplIse/ILfX
 ajtps6LdW02M6M5BkDc/J3x6sAqvwGETLN0kJKpLMApwSE2Xfd3RJnm5NL6MCrIQujM6
 PaggSpHwJTbxoWQRTLuvKQAX98P6KK44WR3uft6hUSBpSHNg/KFG2Ss2eJxhh7qiPtAQ
 3z1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdfq3BVkcxBOdhVvdlleoBHR7EGe8wNQ4j46txx9KfOH1FUrZJooT6T/H1dJt9pUEBIwc45KNGAGkfxHg+6cyn+H1Weicm60bEQtDLrRhm
X-Gm-Message-State: AOJu0YwRsmCv/WqCZHT+qi01a76UHzyG/73pPnVfGNe9mwuqhtII8eLW
 4EYLeyZzyNCW1mvsm4OpPyf3QJrKMhtkKH/jNDTYctPeAUSc9x/jJfRTonrCCKk=
X-Google-Smtp-Source: AGHT+IEJDJbJ0nmjp0FdUDEdV4/Bu3Xu/XaM3QtCeSYzxL+1CRkCFEiMq1C2y/BjX9CIR2z91E+1Wg==
X-Received: by 2002:a2e:9684:0:b0:2ec:53a8:4b3e with SMTP id
 38308e7fff4ca-2ec5b387fcamr53011001fa.38.1719376287461; 
 Tue, 25 Jun 2024 21:31:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec67316e57sm4088891fa.103.2024.06.25.21.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 21:31:27 -0700 (PDT)
Date: Wed, 26 Jun 2024 07:31:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: Re: [PATCH] dt-bindings: display/msm/gmu: fix the schema being not
 applied
Message-ID: <vuzzs5xd2zacpamln7apyhnxebg3xadkagzheg5cz2fnuj2ggc@lancgcviktpy>
References: <20240623125930.110741-1-krzysztof.kozlowski@linaro.org>
 <20240625225127.GA361957-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625225127.GA361957-robh@kernel.org>
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

On Tue, Jun 25, 2024 at 04:51:27PM GMT, Rob Herring wrote:
> On Sun, Jun 23, 2024 at 02:59:30PM +0200, Krzysztof Kozlowski wrote:
> > dtschema v2024.4, v2024.5 and maybe earlier do not select device nodes for
> 
> That should be just since db9c05a08709 ("validator: Rework selecting 
> schemas for validation") AKA the 6x speed up in v2024.04.
> 
> > given binding validation if the schema contains compatible list with
> > pattern and a const fallback.  This leads to binding being a no-op - not
> > being applied at all.  Issue should be fixed in the dtschema but for now
> > add a work-around do the binding can be used against DTS validation.
> 
> The issue is we only look at the first compatible. I'm testing out a fix 
> and will apply it tomorrow assuming no issues. With that, I don't think 
> we should apply this patch.

I think we ended up picking up the next iteration of the patch, but we
can probably land a revert later.

> 
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > ---
> > 
> > Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > ---
> >  .../devicetree/bindings/display/msm/gmu.yaml         | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> > index b3837368a260..8d1b515f59ec 100644
> > --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> > @@ -17,6 +17,18 @@ description: |
> >    management and support to improve power efficiency and reduce the load on
> >    the CPU.
> >  
> > +# dtschema does not select nodes based on pattern+const, so add custom select
> > +# as a work-around:
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - qcom,adreno-gmu
> > +          - qcom,adreno-gmu-wrapper
> > +  required:
> > +    - compatible
> > +
> >  properties:
> >    compatible:
> >      oneOf:
> > -- 
> > 2.43.0
> > 

-- 
With best wishes
Dmitry
