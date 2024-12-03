Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7FC9E1DD3
	for <lists+freedreno@lfdr.de>; Tue,  3 Dec 2024 14:41:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBD910E46B;
	Tue,  3 Dec 2024 13:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dgOtvvRH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E376D10E45E
 for <freedreno@lists.freedesktop.org>; Tue,  3 Dec 2024 13:41:53 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2ffbfee94d7so46126061fa.3
 for <freedreno@lists.freedesktop.org>; Tue, 03 Dec 2024 05:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733233312; x=1733838112; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=b9EQvBAb2SX0qrGU/ZgIliBiKbnHvi2rA/qAWxRRbY0=;
 b=dgOtvvRHMG24nfe3O4fPch6BmK70W6Ss+RcbmHMmvVcZie4jnLSn2R0ioVWMx5YQxH
 AEikMefN713cb/6pkjphrUytDNyfnjoPUfbEiOOjAOFywYuRhFq82Gll1MozwF0BXtQE
 hb4dO8KU+EogoU9fARusk8OpS+PDwmOeRZhZgcAzUXIOFKhOT3zZr8ro9KSUdaJXtIkK
 vCoAShRx8h/LgBFIDWr62UWPhH+Vzh1u3GAC9N1qmEllWUEzHkXJo4jHi+etEGfCVWaI
 2aOnD8oHJC7UkMzU+4CD+guhybVNgLDbEiSvn6sgIBGNkS1s2dek7Q76id77449BXq6M
 rC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733233312; x=1733838112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b9EQvBAb2SX0qrGU/ZgIliBiKbnHvi2rA/qAWxRRbY0=;
 b=wcfuep6EQ3o1EEEDBG6d9KNftUCDcHksS/X9h21U7tG9gB79WEmu3izQ6Fd7DD7GB7
 CuzrtVN3MPBs0ud8dle9nkfHmoVPbkrv4yeq+CKhKT40PTzetQk8G0QGrxq6dGNo27xh
 0VWPXuFIfPHc+jCpb5Fb0lmQT0Fgnp5pSa5kRBTO359nNDfKGZCge0cg2OaDmzKUJDBu
 NBLv9OxMZO0tqhqgbOFPIPx/6M1xPb9OObaYIRzWalJsHHIhJoWn8X1eXIqXbdDneA6I
 NL0+q0clK/ODhK8NA0x6LFIoQ5kDefF+/0JxK5+38SSPH/V8Au/S2yy3ILsDQ5qzsvWN
 5sfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfe3ML3gPgOA9a8D9xY2DmO0Jjp2WH73hx2hgHj0TGdPngd5sLW82K4l+5Yi5dIgZ4lYIZomzP3Qc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlA5tgbfOaPe6b0ldd7e4TbUmogLbCb5yqY4CYZ8puOLfvAy+G
 kSaTKwqQk2CN//iTZnmHvmpCg6jc6rjDYbG6F6OD59VfZ5fgjzzW2tXy1R8azAs=
X-Gm-Gg: ASbGncvYozBajYbBhgoEK7ZQs9qefVxp/zc0oxax3SaYKRc/JvPomHG5tS4B82EMVzk
 OpAcKdkMvLsVayMONsXMav3N9bg32h8fGt2fAlLz5KBrdSw9Ti/0go/9cFms1NsdYHPdIuOEWk3
 /yleD7CU9ISrajMG+9bVeDjyQOPVvMt5t8D8YOl2Ov6GemiM5QO6mcwYZGTqIdsKEGsVw2nGcgn
 sss6dRFXuAMsx5GO4cgply8CSWeuffSZNZnfPW+eCHobqEBie9x2jDnfP6lltF8eW/pDGE/TxPz
 OcxTSIfrBMMsI2E6JsmO68YOzlVM5g==
X-Google-Smtp-Source: AGHT+IHpMzPr6Lls4GRyBuCcJBMUBsc/X9uSkqqmTyZzvhlEVvAz5e+LXYqBKqUPPK3QZnPGFneqVQ==
X-Received: by 2002:a2e:a99f:0:b0:2ff:d49f:dd4a with SMTP id
 38308e7fff4ca-30014e2437fmr870081fa.21.1733233311908; 
 Tue, 03 Dec 2024 05:41:51 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffdfc75236sm16038451fa.86.2024.12.03.05.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 05:41:50 -0800 (PST)
Date: Tue, 3 Dec 2024 15:41:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: display: msm: dp-controller: document
 clock parents better
Message-ID: <gpqrugcsyhz32bvip5mgjtcservhral2o5b6c5nz4ocwbjw5uo@eypv4x6jyrdr>
References: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
 <20241202-dp_mst_bindings-v1-2-9a9a43b0624a@quicinc.com>
 <bfa857c2-cd74-4fe2-a88c-3b35a58710b0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfa857c2-cd74-4fe2-a88c-3b35a58710b0@kernel.org>
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

On Tue, Dec 03, 2024 at 09:01:31AM +0100, Krzysztof Kozlowski wrote:
> On 03/12/2024 04:31, Abhinav Kumar wrote:
> > Document the assigned-clock-parents better for the DP controller node
> > to indicate its functionality better.
> 
> 
> You change the clocks entirely, not "document". I would say that's an
> ABI break if it really is a Linux requirement. You could avoid any
> problems by just dropping the property from binding.

But if you take a look at the existing usage, the proposed change
matches the behaviour. So, I'd say, it's really a change that makes
documentation follow the actual hardware.

> 
> > 
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > ---
> >  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > index 35ae2630c2b3..9fe2bf0484d8 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > @@ -72,8 +72,8 @@ properties:
> >  
> >    assigned-clock-parents:
> >      items:
> > -      - description: phy 0 parent
> > -      - description: phy 1 parent
> > +      - description: Link clock PLL output provided by PHY block
> > +      - description: Stream 0 pixel clock PLL output provided by PHY block
> 
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
