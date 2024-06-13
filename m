Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E949069A0
	for <lists+freedreno@lfdr.de>; Thu, 13 Jun 2024 12:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1404B10E9F9;
	Thu, 13 Jun 2024 10:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DHTRb/83";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79C610E9FD
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jun 2024 10:07:59 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5295e488248so984591e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jun 2024 03:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718273278; x=1718878078; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RYvXhUR4MqvdO8CyI6lyGFQa8ObvUY9+LLJIm6+1jFA=;
 b=DHTRb/83XsT4t/KdpTpw+vVg6bsrYPh23ae1M4ev5PUCP8DK7RHhejAtbaf5wEMG4R
 pnWoU+SHdbchTNplWe73mqiUp7mZXplasl09b9EkMSn5x2s3DkAc98YmKXAvXFF2Bn+t
 kHgdxNUJQegAu9qsqKYpuwOEe/FJGjvXPvhWOhkCArYoU4pGeiZJC6aeE1TSQEpqQUWt
 NDfY9jCheX3KjKQx/4+kVWUMJr3oPteR/iXVVHcyPbUx5iGk35Pqgj7zsZa9DeZe1LoQ
 Ov45WK4wu2xDQYrS985rH6G7djdWA8Hg1HFSPoSQKZ31CVlStSVO/rnu0BNzLiWDvVA3
 yQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718273278; x=1718878078;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RYvXhUR4MqvdO8CyI6lyGFQa8ObvUY9+LLJIm6+1jFA=;
 b=ackPmk7HgxiKC5ppVmGAvHrwxr9jLaWTyjIkN3yFDq0vVjXsLfVMaO+yO8sk1lbcRb
 8SNLamaEeTtTBdJBCQp42yvkpxPNklh1jvPYVv3GduNHVZ8hpQ1JzOu7S1H/Gzg5eiY5
 PkRwl2ZdpduQ4zaiDhvyS/JB2Tw1EVWjxK7pY7kS7I/BNwXDtkVFwbBB/SRkdRgW9aep
 dYNLZzBjr55aJcu4EIutreX51E+uA/aBBSxXYCBNOkcsLH0luqmr1iPQkcY0SBhsDLWB
 RFpHe1MQViQT7HRJmHwJ3tuzsxcLv9aK3LHsonpFwJu8ksFZV3VO4B8NsD2cDKWuaELb
 AEEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWINKn7l/7Dd5t8peLr80RkbTdIXgh9R12ZrPQqvVPYZYyi3U5aTbF3bOCXnfpKrsiXiadgHqUHttlmb+ArwH96JS48UIuy+mMz86plMp/R
X-Gm-Message-State: AOJu0Yylk0cwVODzK3an4tg0+WYFgJdQc4bnGbc1PSr7JfKO58Lk3DXG
 2BGZxAAW6VmCcH1FC1XZ19QB/3u5r0ozRNkMYsBthXqF9J+6WHFhDIicCD9kDUU=
X-Google-Smtp-Source: AGHT+IEIfjbzuR+TJYfn0WkM5bFWWQE5UXg72/ta38D4UK601aQPCRVEmPoKXYW21UYlolSVF5CCJQ==
X-Received: by 2002:a05:6512:3096:b0:52c:893c:6c2c with SMTP id
 2adb3069b0e04-52c9a3dfaeemr3306688e87.40.1718273277753; 
 Thu, 13 Jun 2024 03:07:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca282f2aasm148599e87.85.2024.06.13.03.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 03:07:57 -0700 (PDT)
Date: Thu, 13 Jun 2024 13:07:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v3 2/4] dt-bindings: display/msm: hdmi: add
 qcom,hdmi-tx-8998
Message-ID: <qf3erx5x7cigdsel6eh4nb4cl7733ag6qxxeblcdjzys6dnrul@nl7mzrm4ljji>
References: <20240606-hdmi-tx-v3-0-9d7feb6d3647@freebox.fr>
 <20240606-hdmi-tx-v3-2-9d7feb6d3647@freebox.fr>
 <Zmnejlkb869mN3eS@matsya>
 <af3f71e5-6864-475d-aa90-74986d516bae@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af3f71e5-6864-475d-aa90-74986d516bae@freebox.fr>
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

On Thu, Jun 13, 2024 at 04:02:24AM +0200, Marc Gonzalez wrote:
> On 12/06/2024 19:44, Vinod Koul wrote:
> 
> > On 06-06-24, 18:07, Marc Gonzalez wrote:
> >
> >> HDMI TX block embedded in the APQ8098.
> > 
> > This one too
> 
> I assume this refers to:
> "Why is the patch titled display/msm, this is phy patch and it should be
> tagged as such."
> 
> I always copy what others have done before me:
> 
> $ git log --oneline Documentation/devicetree/bindings/display/msm/hdmi.yaml
> 27339d689d2f9 dt-bindings: display/msm: hdmi: add qcom,hdmi-tx-8998
> 6c04d89a6138a dt-bindings: display/msm: hdmi: mark hdmi-mux-supply as deprecated
> e3c5ce88e8f93 dt-bindings: display/msm: hdmi: mark old GPIO properties as deprecated
> 2f14bc38d88a4 dt-bindings: display/msm: hdmi: split and convert to yaml
> 
> Are you saying we should diverge from the previous nomenclature?

This one is fine. For the phy bindings please use phy: prefix.

-- 
With best wishes
Dmitry
