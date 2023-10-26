Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E04B7D8A0A
	for <lists+freedreno@lfdr.de>; Thu, 26 Oct 2023 23:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C4110E8AF;
	Thu, 26 Oct 2023 21:05:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229DA10E8AF
 for <freedreno@lists.freedesktop.org>; Thu, 26 Oct 2023 21:05:29 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5a7dd65052aso11519677b3.0
 for <freedreno@lists.freedesktop.org>; Thu, 26 Oct 2023 14:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698354328; x=1698959128; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7tvKP9i4A7CJ6jTg2zl2DLpBGqflQ9GIOuLSkvcrYnQ=;
 b=L0+mD9WL0tYbSNVYvak8HwcVFtx/UEeKkZ65mjX6ocAnuv1rl6VZlPvENZovE/V441
 KxVMtLViyWb8kzYv/+qjgfkCWIjr8oF6Y/C5Lkx/yuzo7mVbStg0uM6P8TRmS/eavcy5
 C4ctrUjgjNPm1rRJ21IPUIT832rtTQ3NEMT0/6hQXi73sIYJpgFinSf3ddHPcxbltE/U
 fb3Mc4NaBPp1PDrSQN+5ew8HEwOzNZKL6exRMWiMeHGiZVEQLN3y6kux/d+mBX9AMMjq
 UlYo3vKexU/+WG7yXYmkCh7muKLLfPSBRmTMs2O3xcer5wxFF83jGeYrfc9lgi/P8LYV
 JFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698354328; x=1698959128;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7tvKP9i4A7CJ6jTg2zl2DLpBGqflQ9GIOuLSkvcrYnQ=;
 b=UOaWcI9dRrYE8FPlN7K/nCvklcT1XfghqVVRpSByRq36gufc0S2jPKIKMVoDOhweDh
 90zGMa7UdByJJLhvKi76fC2SfIKFJJ7o0RYBIF1rOpNJmULxGIe5m2C7YrVINxkq2EJm
 PJyKaR8k8cfSCuNlHHmCdCiwTrAjx22aB4vw5cHM52TyN+Ti8TZL99TCMptaRQlaoz4x
 OaWip/sKapaQ3LDlLTi+b0KxUpoIFpjGkV8ZEgfBtCy/77nccL3nbMc1tROuOtl8FRZk
 XeIzJc/ZTEF0WNDA3FYBVd/0JU3ME9afYruaHewBXqIO5s6K9Qj2+Oy108HwQEZyW6Ih
 9ueQ==
X-Gm-Message-State: AOJu0Yw9PUTHSlUPr/8h1wGQLNZ4JT3F7XDpFA2e/08RgRZBiRNXsPYs
 /Cuzco1gxKOi37P5VUZkONWmlRrXyPBkJXgv5avLZA==
X-Google-Smtp-Source: AGHT+IHqztsHAMPpem0Cm24hgkWReCxLjW8B68euPJ7kMBXHdNf40CfG/Y/Nz3heXg6kPycfjXRqDbPnBKnN7HN35UI=
X-Received: by 2002:a81:eb0a:0:b0:59f:773a:b14c with SMTP id
 n10-20020a81eb0a000000b0059f773ab14cmr673384ywm.37.1698354328191; Thu, 26 Oct
 2023 14:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
 <20231004003125.2289613-2-dmitry.baryshkov@linaro.org>
 <abc36c33-bfd9-4451-80ab-a631492044de@linaro.org>
 <ed18292b-efe8-48fc-8696-79e51acf8ab4@linaro.org>
 <CAA8EJpo_H3-Lk1GQXGQikXiCtaEQ4C+FBW-fz9D2TbuX2HDhRA@mail.gmail.com>
 <ac995dde-b5b3-4dd8-b704-5081cf9f9162@linaro.org>
In-Reply-To: <ac995dde-b5b3-4dd8-b704-5081cf9f9162@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 27 Oct 2023 00:05:17 +0300
Message-ID: <CAA8EJpoiNhJ1Cn9NDMk2OYQ4x-OyxOS2V6Z=8fDsHSyyxdhAnw@mail.gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH 1/2] clk: qcom: implement RCG2 'parked'
 clock support
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, freedreno@lists.freedesktop.org,
 Michael Turquette <mturquette@baylibre.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 26 Oct 2023 at 23:49, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 10/26/23 22:47, Dmitry Baryshkov wrote:
> > On Thu, 26 Oct 2023 at 21:57, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >>
> >>
> >>
> >> On 10/7/23 01:43, Konrad Dybcio wrote:
> >>> On 4.10.2023 02:31, Dmitry Baryshkov wrote:
> >>>> clk_rcg2_shared_ops implements support for the case of the RCG which
> >>>> must not be completely turned off. However its design has one major
> >>>> drawback: it doesn't allow us to properly implement the is_enabled
> >>>> callback, which causes different kinds of misbehaviour from the CCF.
> >>>>
> >>>> Follow the idea behind clk_regmap_phy_mux_ops and implement the new
> >>>> clk_rcg2_parked_ops. It also targets the clocks which must not be fully
> >>>> switched off (and shared most of the implementation with
> >>>> clk_rcg2_shared_ops). The major difference is that it requires that the
> >>>> parent map doesn't conain the safe (parked) clock source. Instead if the
> >>>> CFG_REG register points to the safe source, the clock is considered to
> >>>> be disabled.
> >>>>
> >>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>> ---
> >>> Would the intention here be to replace all usages of _shared_?
> >
> > Yes
> Then I suppose an immediate followup question would be: "why
> introduce new ops instead of replacing the existing ones in the
> patchset?".

Because using this ops requires doing more than just replacing the
name. it also requires dropping the XO source from the parent maps. So
I'd prefer to perform this migration on a driver-by-driver basis.
Otherwise it might be very easy to introduce a mistake somewhere.

-- 
With best wishes
Dmitry
