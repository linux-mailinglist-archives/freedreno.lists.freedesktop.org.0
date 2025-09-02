Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 423AEB409E1
	for <lists+freedreno@lfdr.de>; Tue,  2 Sep 2025 17:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E770610E7C5;
	Tue,  2 Sep 2025 15:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="luJbMLL4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708B610E7C5
 for <freedreno@lists.freedesktop.org>; Tue,  2 Sep 2025 15:57:32 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqFVk012720
 for <freedreno@lists.freedesktop.org>; Tue, 2 Sep 2025 15:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=TREnSWpfAdWrhmOtMgkCSdJYlV1MbSdoxyYVKxg6HYw=; b=lu
 JbMLL47Ftx9g9Db4lqWD1qbEVabosqCPd+0Qr/JAi6TePDUU/GKbTLq894xe1JKX
 WOHsWP+nlfxuW3JHRyx6lbHkNeRejs7DbeZmIo4te8gF/spHIzDCCoH2biGydJnT
 CMjIbhLCbdCCu+j9H5VDPslhQ0AXdVx3AVVlRVwSv+DGX/UhTo4/+Rd9FnlNVAe2
 5XUo2komMoOHF3B6orvdFkAW0kDOc3pkTQnO32l0EvBc0WWjmEsC7wYYHmGRmnKq
 5OrDadHtvq05ukhB++lLHUr9wQuEsC5fHr3EwzAr5PFA4kqs84gy76CI8sQD9ghw
 5LLP0Lwf52ooGiIRulDA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk90769-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 15:57:31 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-435de7f687eso5295531b6e.2
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 08:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756828651; x=1757433451;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TREnSWpfAdWrhmOtMgkCSdJYlV1MbSdoxyYVKxg6HYw=;
 b=Zta1JnNicfuT5bnJfKNhl0NfeY/50aJxzbiIc6fFZf6IpocLAXL2u5TN/tM64AkpIj
 DcyUCwmF32jc6kx9M6Hv53GZEWJBWMywiq70NtJ62ju5NeRAbLtftkAkQr3jmpVmEknr
 HHwRDcbMHl/6YEvJagXg7Mu6ypQCZj66YSFF6Tm+0EzOgj3fYVcO5A0+jPNWNq0xXHpx
 37G2A25qbuxWWvJrQE9KTXTw18GU/0TFuYGtBTGSDqoM/eXxG+AvNYYsFrq2p+gk7Ynw
 ogpxryXEG+OR3nK3weVCA1P9yf7V6UK2xFxhIttw8eyJBjcYVmsOM/iVLYqSPq6JOuiz
 72yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0qMjbePMdqvUJS7lf5ZKkil8spU7vDCBYroNpypDhHBy1v/FIHTaYz7nKPcVxX3skKEPSfBl9RP4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRbCMODb7IumKtuNJzO9JlBPvDx4yY6+iy0NV4++DDmdxhAFGK
 AqzAFfT6IRvJcaHqTLJb2s2diFK8qpvkdejTBBoZS6UAumAjifgn/JJHzXsjnK6XYYb9Un/pbNq
 gZpc+HKBpkXUgIGTUkfWM4r59ZGmI36eGIRLYlgwA8D7ZYZ03qKe1t1R5waOqqwcUZKeX/hS6Vb
 RgszCKPQWstynIwAKuJRLI/wiZO6yeiUY6Ez/YW3aBMqnjOw==
X-Gm-Gg: ASbGncuS9wqJ8BKPMvg013DM2yEskV0pLKpH6nrx+21DJbpbxvmM5n4o03gtX1iQuqk
 OKKevuOxovPvgNdX8daCUHK0mgtFc5wwp4jBUsRiCg+zdJFbBRNkGPi1Du9+ejgghu+iVB1nu0B
 MGF4W6RPl0y0/MuABF+fl+RX1rlMo1ooNdLJIS2GSrEgGMt9Bjxi/3
X-Received: by 2002:a05:6808:152b:b0:437:b10d:3b46 with SMTP id
 5614622812f47-437f7de1519mr5637668b6e.30.1756828650787; 
 Tue, 02 Sep 2025 08:57:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYnnQDfuHV9n/jWre+x5H5L+i6EA8p0glanc4jK3wzaEOdW1w8zr1QPsTQkge73XmH1NyXNbBSBZwJ1vwOsTc=
X-Received: by 2002:a05:6808:152b:b0:437:b10d:3b46 with SMTP id
 5614622812f47-437f7de1519mr5637653b6e.30.1756828650361; Tue, 02 Sep 2025
 08:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-4-f3ec9baed513@oss.qualcomm.com>
 <694f0989-64ea-4c3c-8613-863da1dd286a@oss.qualcomm.com>
In-Reply-To: <694f0989-64ea-4c3c-8613-863da1dd286a@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 08:57:19 -0700
X-Gm-Features: Ac12FXzQPwDIUy_DiVh-kEO71EFonDrLLU22HZlou8nVFBUUUe2guiMPv6umOuA
Message-ID: <CACSVV037e-GquRk7P1_qT7T4HF=f-TF93FpJ16NiKShqicaCfw@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/msm/a6xx: Add a comment to acd_probe()
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: VRDxHaV5Ao0XbmURMu3DF-piHktNbw7T
X-Proofpoint-ORIG-GUID: VRDxHaV5Ao0XbmURMu3DF-piHktNbw7T
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b713ec cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=ycJl_s5THFxdJBPSnQsA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX2Ovi6HWveX5w
 ns4qvoprgyel/zwl5Fhz1VREEO/PyJjsIuHfbJhPUmna4+D/9oYh9olMLs61h1LxNzngDkbl+/r
 qs4GToGAcZW3T8/AlaTbPRPQj54IGoxtn5IOk15gH43AzMPVNVwxkJTZnW+XILilsWH81BELfvO
 UHyEmcTJcVNZ4+KYeR0kMRqEZYHKID56n6ZPqpz196gNZrTWrHe78EpyBeaYT+baCu+tr3/QzKp
 0n+kEV8vc5koNoA1zsc1A21HunCZFThYcrFZKrScQrBZhhg/2GdJ7C+WV1FxHSLdaglXSfuSg49
 jQcYFEqEjPXJj5LQZMtqSenR3jxYOOkhqd7Jxy7oBUeOQJ0BEreXGppcNkYZEHIvYjJxWlr0ep4
 42+L4rxO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Sep 2, 2025 at 5:33=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/2/25 1:50 PM, Akhil P Oommen wrote:
> > It is not obvious why we can skip error checking of
> > dev_pm_opp_find_freq_exact() API. Add a comment explaining it.
> >
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gmu.c
> > index ea52374c9fcd481d816ed9608e9f6eb1c2e3005a..de8f7051402bf0fd931fc06=
5b5c4c49e2bfd5dc7 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > @@ -1694,6 +1694,7 @@ static int a6xx_gmu_acd_probe(struct a6xx_gmu *gm=
u)
> >               u32 val;
> >
> >               freq =3D gmu->gpu_freqs[i];
> > +             /* This is unlikely to fail because we are passing back a=
 known freq */
>
> This could probably mention that known =3D=3D we just retrieved it a coup=
le
> function calls above, but I suppose the reader can come up with such
> conclusions

Also, I think s/unlikely/not expected/ ?  "Unlikely" implies that it
could still happen..

BR,
-R

>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
