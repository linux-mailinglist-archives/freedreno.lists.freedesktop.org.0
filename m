Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 606E9BEE49F
	for <lists+freedreno@lfdr.de>; Sun, 19 Oct 2025 14:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03F310E1F4;
	Sun, 19 Oct 2025 12:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="En65Ngbl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE6510E1F4
 for <freedreno@lists.freedesktop.org>; Sun, 19 Oct 2025 12:14:29 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J8PNhH020811
 for <freedreno@lists.freedesktop.org>; Sun, 19 Oct 2025 12:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 puNPrhTEXrfqnZblxaqGqUil1ruzTr+zCkgmrxJ5Bek=; b=En65NgblGY8NIrNy
 BjKP5KUK4ujMB3MNse92ose8la5TWB9nGsRowsVSqd47vWUpN1okqFrwbLRbe/Pe
 FNXx2CSQ1X00JbGgoIsnH6KHLWY1Qolrujvn/NYfSUhBI4uBbBj3taB/vAEKIjMg
 G+LNq+UP+2K3EqrMaLSzL+a9/fwmXBc2Vc95pgWrtnRnurCCfm6AZnlgQNC/gZv1
 RIiZAK7ux1qSlEfc63GcdYqlW9InQamQsiC4mUnRhK9etJjKT0GL+cHeJx6Kjb/s
 cRb/ARXhJ2FMsgtGx0SoulEaH3RtZW1rxb22UtmhV6SMakH6axSzxO6MljqW6bs8
 EtMyZw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2yv2a5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 19 Oct 2025 12:14:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-88f1dad9992so364808685a.1
 for <freedreno@lists.freedesktop.org>; Sun, 19 Oct 2025 05:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760876068; x=1761480868;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=puNPrhTEXrfqnZblxaqGqUil1ruzTr+zCkgmrxJ5Bek=;
 b=ONU/TkuRy8YyChkDp1O0TTJF0Kn/yUQXzoRoB/NW/bWnqndKYwSSzLijpDO52mFVwx
 OSjnFTj2pqsMc8CFA4K9i3EdYAFTt9NUHxmizRwyw1N1hd/KfrBz/bK6qSJUqvmX7SEr
 LsATceEYAKcUtcc1QKpXRTrB02psfdxbMSfp+8BQyxCuHUIMq7N/o2Tbb+ANHIS3ofY8
 B7EnOm4G9YJ75GjYNMQ3rILHhzqC+G9fETT60IZREVLl+p48X6LNvSiIA0N1Fm74HrYm
 Wnu6zFgOxRdCGQ++YEA19DUoDdCCVptlZjDomD6XI6LlzI/hT1tYWrtE9zfPv3IpurOU
 914w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEP89aVv5O5pKNpwCMygGqUq5ThlT6VOcGL1fb5icsXNFXq8fYfRO0ty1jPZTe7MTgUIOW1NXuBEA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwparttKoXpBBGr4rm6PEIpLoEhYI988hCf/WOJ+6MVFe/Ds6NZ
 chjFSYMs1DmvQS1cg+KIU71IELB2kP+D7senM90n4Qcjl7TDS17ZgikKuEvILFxZf67vympYUxK
 YNWnFwxOnv56yRHAIbIxrTB+fm4pGMCAlcWuegKz68oI0UmOqdb83jcNKYBHvLrY3W1bwcsM=
X-Gm-Gg: ASbGnct2Y62ESVo2tO15U4vdo0yZI66+w+8gJRfzp1DVyAc+TlCRTIj1Ehe/rGsRmCJ
 NHL/KEMlIuXt67vq9Dtab6yl+3wyIwowBwuFm5DI/CF8rEihRM/MXQ7yvprCYljwThAJvZqwQD8
 A3ONJVyZDOq6IpNAhoSHJ5fkCDO1fwEdqxGbFgrcalqNW74LJ0NveOZUQPnI4cWNv3EkxZIut9S
 PtQk1LUbwAdr5xxGo0kzk7vDRUWXOFpfEo/aFdueY20ST1dRFLgGIyfC1ijOcPszMVnVEuUdt/T
 P4YDceGrU1SOQG/ioAplRzGr+IcEBpTz6CvuHlbpykZC0RodKOznY8Sw/k1A4dyKuY8HkYe35aY
 PWzcz3oMXjE39ObQfKyiBVIGDlGwo/fHf48GemAPd+MuhJaOcuSUmHsLkwSB5WNdFppmwEknl2E
 ZGgHYM6ClnCDk=
X-Received: by 2002:ac8:5985:0:b0:4e8:911a:2af1 with SMTP id
 d75a77b69052e-4e89d3625e2mr152707011cf.46.1760876067801; 
 Sun, 19 Oct 2025 05:14:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8+CZ0NJ9bBoZZ1GZiXuCbYiL/YP/qmggrLH+uJV7bA2b9ganhGBoaFnRrleOl3gY/Yk+zFA==
X-Received: by 2002:ac8:5985:0:b0:4e8:911a:2af1 with SMTP id
 d75a77b69052e-4e89d3625e2mr152706601cf.46.1760876067319; 
 Sun, 19 Oct 2025 05:14:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-591deec0b98sm1528227e87.40.2025.10.19.05.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Oct 2025 05:14:26 -0700 (PDT)
Date: Sun, 19 Oct 2025 15:14:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mahap@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, mani@kernel.org,
 James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
 vkoul@kernel.org, kishon@kernel.org,
 cros-qcom-dts-watchers@chromium.org, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 0/3] Add edp reference clock for lemans
Message-ID: <ql5ps7cv7x6hz3otzz45uv6pbr64x2hdapa66vq2jtnt6l536h@kbktvupxpf4y>
References: <20251013104806.6599-1-quic_riteshk@quicinc.com>
 <7jmk3txdrnit6zn7ufra7davmomggd3graizdu6wqonp3lljza@mfnxt2owpknq>
 <4bd619e7-e9ca-44a8-9d36-10c18d7a8157@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bd619e7-e9ca-44a8-9d36-10c18d7a8157@quicinc.com>
X-Proofpoint-ORIG-GUID: HnY69h12cc1f2dCVSh7F0tTaA9AfM3PS
X-Proofpoint-GUID: HnY69h12cc1f2dCVSh7F0tTaA9AfM3PS
X-Authority-Analysis: v=2.4 cv=f+5FxeyM c=1 sm=1 tr=0 ts=68f4d624 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=FYAu2dUYg65mSESSDlUA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfXx+QJl3bv7sJp
 g7yKi3GnDhfOCKYpg8Dd9X0d+0G6rcFMGOZiP4LNhseHxJHdh++6TXbWoB9JnqV0AZcji2eg5NI
 knl3Rrq/Gyg75p3ES4IBsJBucb13t+gzIACtnhwdUlL4o5C5BEwaV/os36s49Cs7cm1UoqGfKcW
 eU1F+m55BEVGWsLVo7pqtvgzYBafaWulfgFTfGeTZz/6ndSFR8JqllqVRtY/UQ0vdfzt7kvzI5N
 g4u1xz17osWmVlfK5aGyBuI/0I8r2n/mzddgSwMRTWCh3vImGC10O7Xza68uKpilBloOf3qD/32
 FXNoCPiGtQtr98MJWCheaF3Xb/K2086/9+HZVKm24wJOq6HZmBusoB5GvPCU792Gg6SRdsCub30
 JQsrw0yA84op2Y42B/HUfuJnTaQ8gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180023
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

On Wed, Oct 15, 2025 at 02:49:08PM +0530, Ritesh Kumar wrote:
> 
> On 10/13/2025 6:04 PM, Dmitry Baryshkov wrote:
> > On Mon, Oct 13, 2025 at 04:18:03PM +0530, Ritesh Kumar wrote:
> > > On lemans chipset, edp reference clock is being voted by ufs mem phy
> > > (ufs_mem_phy: phy@1d87000). But after commit 77d2fa54a9457
> > > ("scsi: ufs: qcom : Refactor phy_power_on/off calls") edp reference
> > > clock is getting turned off, leading to below phy poweron failure on
> > > lemans edp phy.
> > 
> > How does UFS turn on eDP reference clock?
> 
> In lemans, GCC_EDP_REF_CLKREF_EN is voted as qref clock in ufs_mem_phy.
> 

Ack, please fix other comments.

> 
> ufs_mem_phy: phy@1d87000 {
>     compatible = "qcom,sa8775p-qmp-ufs-phy";
>     reg = <0x0 0x01d87000 0x0 0xe10>;
>     /*
>      * Yes, GCC_EDP_REF_CLKREF_EN is correct in qref. It
>      * enables the CXO clock to eDP *and* UFS PHY.
>      */
>     clocks = <&rpmhcc RPMH_CXO_CLK>,
>              <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
>              <&gcc GCC_EDP_REF_CLKREF_EN>;
>     clock-names = "ref", "ref_aux", "qref";
> 
> > 
> > 

-- 
With best wishes
Dmitry
