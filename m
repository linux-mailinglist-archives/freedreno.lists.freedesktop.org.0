Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 503DC5F1C5F
	for <lists+freedreno@lfdr.de>; Sat,  1 Oct 2022 15:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E023D10E63D;
	Sat,  1 Oct 2022 13:36:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716DD10E643
 for <freedreno@lists.freedesktop.org>; Sat,  1 Oct 2022 13:35:59 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id a10so7524783ljq.0
 for <freedreno@lists.freedesktop.org>; Sat, 01 Oct 2022 06:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date; bh=CG8R/L4pPWym3ANx8yZmnov0YG/TUNdQM5EA24rS0E4=;
 b=AiqSXPtKbR4lSYpT8z/2+mby/RDCrwNw4LeuUaGBfhWKs4/FVypZkt/KC+/dlceUD1
 xdbaKkYeFJ/KVJwYMcSO5rWs4sLoD2IrrBMk4Hl+lte7fIRf9ciLCyrKe0Is4Em3bxeq
 i1kzXY6Fe30DJgrU4FhZNY91hyMJEOCwf6rw4NcbAuTZoHxNxmTnlv9/DsmjWkSe9PIC
 gDCbeNaWtazlOjim66oEyqQJD4bLpVU4sgYFTU4cdWMAcJ4ZW6yidoM3o6t5pEWs9k+v
 6iN85ji8JQe40GK4dG2oaZRsZNZY/RhJOkD41YaAHDaj7FH3bgg1PFRk1jEsTRMWom5r
 Y5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=CG8R/L4pPWym3ANx8yZmnov0YG/TUNdQM5EA24rS0E4=;
 b=MWWspE+n2NoTyd4rqu/q1LObmxp3eYXicNMWCFV3JhC7rfZ1wAJvtyYRtbPdmSbiFU
 5Q8lpe6HGNnNajNRDMoICZ4dqc8q46Maavn2jlPWK9URltXlh+u3K846fef8LqNBuQFX
 gd0LVvGK0n4v84DqJApVzKrR+F+g1mPGjFTGr+4Gf+ztgIe/46i8Hge8OuOK3cLpo6iq
 wghOsh8N32SiLH6KoMSfCLPNTiDiC2PzIIneTZ/BRMp3yOxwWUzmFsaEyzQ9VaRdEzd5
 2wNn/guI+FiXARc0GSAyqaT+uzY06sQIHqj6ITMhO1l8UNZNOYoVzVJk8YjB7ePViE91
 T0jQ==
X-Gm-Message-State: ACrzQf1ElUs71vfRs8O1IYMi4J9ThB2ZGLcBLbMGdz7hyrnXrokzEOBl
 L8PO9P92p3traA/hjjt3NO1GqA==
X-Google-Smtp-Source: AMsMyM6UkHvBbcIhpUjgV6+jAN/oKUp5wj4L3+JZ4/qDnhRKerjqCD22VB4X7hYo6GNQ4bXmGscdYA==
X-Received: by 2002:a2e:a9a9:0:b0:26c:6ec5:290 with SMTP id
 x41-20020a2ea9a9000000b0026c6ec50290mr3891735ljq.186.1664631357680; 
 Sat, 01 Oct 2022 06:35:57 -0700 (PDT)
Received: from [127.0.0.1] ([188.162.64.124]) by smtp.gmail.com with ESMTPSA id
 h4-20020a056512220400b0049473593f2csm762095lfu.182.2022.10.01.06.35.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 01 Oct 2022 06:35:57 -0700 (PDT)
Date: Fri, 30 Sep 2022 11:29:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Doug Anderson <dianders@chromium.org>,
 Kalyan Thota <quic_kalyant@quicinc.com>
User-Agent: K-9 Mail for Android
In-Reply-To: <CAD=FV=UT-GmAOYrCBRU0bhGeXU=pOGDbk=Jq7JEk40tyEH0zLA@mail.gmail.com>
References: <1663157784-22232-1-git-send-email-quic_kalyant@quicinc.com>
 <CAD=FV=UT-GmAOYrCBRU0bhGeXU=pOGDbk=Jq7JEk40tyEH0zLA@mail.gmail.com>
Message-ID: <A446B5C0-1EAA-4A24-8E7B-3C0EB2024026@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [v5] drm/msm/disp/dpu1: add support for dspp sub
 block flush in sc7280
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>, y@qualcomm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 29 September 2022 19:13:20 GMT+03:00, Doug Anderson <dianders@chromium=
=2Eorg> wrote:
>Hi,
>
>On Wed, Sep 14, 2022 at 5:16 AM Kalyan Thota <quic_kalyant@quicinc=2Ecom>=
 wrote:
>>
>> Flush mechanism for DSPP blocks has changed in sc7280 family, it
>> allows individual sub blocks to be flushed in coordination with
>> master flush control=2E
>>
>> Representation: master_flush && (PCC_flush | IGC_flush =2E=2E etc )
>>
>> This change adds necessary support for the above design=2E
>>
>> Changes in v1:
>> - Few nits (Doug, Dmitry)
>> - Restrict sub-block flush programming to dpu_hw_ctl file (Dmitry)
>>
>> Changes in v2:
>> - Move the address offset to flush macro (Dmitry)
>> - Seperate ops for the sub block flush (Dmitry)
>>
>> Changes in v3:
>> - Reuse the DPU_DSPP_xx enum instead of a new one (Dmitry)
>>
>> Changes in v4:
>> - Use shorter version for unsigned int (Stephen)
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc=2Ec       |  2 +-
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog=2Ec |  5 +++-
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog=2Eh |  4 +++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl=2Ec     | 35 ++++++++++++++++=
++++++++--
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl=2Eh     | 10 ++++++--
>>  5 files changed, 50 insertions(+), 6 deletions(-)
>
>Breadcrumbs: though this is tagged in the subject as v5 I think the
>newest version is actually "resend v4" [1] which just fixes the
>Signed-off-by=2E

Not to mention that v5 misses the S-o-B tag=2E

>
>[1] https://lore=2Ekernel=2Eorg/r/1663825463-6715-1-git-send-email-quic_k=
alyant@quicinc=2Ecom

--=20
With best wishes
Dmitry
