Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CACC18280
	for <lists+freedreno@lfdr.de>; Wed, 29 Oct 2025 04:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0231710E6ED;
	Wed, 29 Oct 2025 03:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XbjZI9NM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ffKiOWR5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A304B10E6F0
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 03:19:50 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlYlu2503383
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 03:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tfuOdHYPuBbRAFi2S3af3q0y
 P5GTo3VvO9e3ehC0+QY=; b=XbjZI9NMTCuvP0ON7ljI95ue2bFZ+B/HKFusXoAu
 qEkt+u/kwHbY8Nxkjzf2PRQWD1DuCUHonMVw5yzIiNiZmhfXP4vdbOAhjk1YiMIG
 zNTDt2EbSh50D7j1fYqcSFrRq98ideoANTkSqSxFp/e3b7oLxSNmJRvJoybnpeP3
 pCviYwjRMLsogwg3RyK2Z76CnbIfWBKVjjMGrg65qXMQ3taif6HPBANHFNWHdaYR
 Lte9dBJUcmzMsOr4ZVRduSwJ5/qxgCc7ppEgZvLXcyOs/NvaPjSStmiVG+lSsaAH
 SaAVA+G4HDXUtIRRgn2eN0Uu81mc0iArsSZc3/5EEFP1oQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1h0a9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 03:19:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8a0aa0df911so1135990485a.3
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 20:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761707989; x=1762312789;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tfuOdHYPuBbRAFi2S3af3q0yP5GTo3VvO9e3ehC0+QY=;
 b=ffKiOWR5v6SUi/EoKAF5CNLoVCe/KXhP/Mta211L9Cj4rfm5zSLU2bBd1kelD9VIxw
 aSrfR7qDzYZVH6AZdNFw7PKRjStqrM/b/urr0YYH5YZQ8oMg4D+QejqjKU/pvY4RGlfw
 4H6TZjIM9L5PHdwY7nyQ3i5r+5R4XBmteQglBzUZlDfVD+9yotBtHzchCySoZCwH2/pm
 6wqvhsJMif/Np7g+/qqLuVvDmSFoEKH8lFhHFjtYbeEiFyGDI0Ee15fI/ECudtaWiiY7
 mSqFZZPZBPHUZVdiCDDsT/GWHMX6Y4StkLZJGDOZIhWSxdsJq8Vdhp17B9NXWAgtUeLZ
 P36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761707989; x=1762312789;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tfuOdHYPuBbRAFi2S3af3q0yP5GTo3VvO9e3ehC0+QY=;
 b=mIKyDnaSD9HaRTs3KW+48pX/W1ypmhfZHBPlG4e+mCb9lhE1IA9rfEixWMReQZZZPv
 m0fbkW4qjkKKqkWZfMcHOvwTycu4QmuD56yQlMo+qUrOFIY0kdjz/J5BwHe6yCT00th5
 ds0xytB+23JCRbVbZPb8cKT8B4jPmxRgRbScAKWtFT1AU+BOSz8//1YbaA2tFi5jU1lG
 or/4Mlgkbz0lwI/z0XIg0TiMrfpXhx17G+Yr1LkRS8RiIcZzudqtUcVHhsPqcX6t8JQm
 6rcMmRteV6NcmLV0FB0aXL0qlrpS0wa9a4+wKn0t4JnE2Q48veRWMSLpOBJ6yny7faJr
 ykFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9GI+XEzDQMNS4DMHprIu1S/qnQTfArMiUdvhSvQLO+/U1w2iIIIjTP5ynsPl7oMw4Vift/0wsUxk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziZbQLZUIuB11Ldp0TvZaExh+q7Gf9oEh5bLd70tWDBpdrarXI
 FeQ9ozRBRCInvdyC+Uw194ZT484Cmy3vLzYu3gM+y352pfoK/q2D7HkpOlrkX+nll4MfctWetOM
 9Uz4aAnN/ynDFu7vO34XKTaULCOd3rxp0qsvwbdq/vVyCVHtj5YHayfV6Oup3lyDmss7i3gM=
X-Gm-Gg: ASbGncuI2hhVfiPiZOLXrcb1QV4XlXAlV4CfPOaY5JM1P9lsRWvSSWzTStoVemBcI+F
 1nhUeq+EjP0RChzfetz0wRF/LAGdKNKGmZM62LdmYpdCvIHmDMPnojNui7eaOpZtagvY95Z+kgZ
 4ud9tm3Cu+fb25tulhvzkssSqTvylM1KgTFWK2SKmFWSPSEnlcU5BqyIM+LiyCOgQJHU/StWzoa
 6UT4DhcBvF1OaGzAHwZmt0g+1qWTlFuWEKK0k9tN+2yyc6T/m8Th59upw9hnY+IEKOs1TF10++8
 uy3ro2BBG1LmnHIisErvd16PHXqVm3dJo1Wknx8zhgP2nBUkHCg/U6JEm9C8IggwE5cx2aaia2X
 8az7LPdTpC5QGYc8P+WPTqyv3peLLnI9sV8IEHRw8TjyLEERmNO1xR95KwsXdMAQE
X-Received: by 2002:a05:620a:c47:b0:8a6:999f:df02 with SMTP id
 af79cd13be357-8a8ea5951e0mr221840985a.0.1761707988866; 
 Tue, 28 Oct 2025 20:19:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPR1bnU91lCiITa3K23J2bvukY1QCUyEKr+SagA9SP4DVjvaGRLpGPgwIenuTxiRjw0NjoWg==
X-Received: by 2002:a05:620a:c47:b0:8a6:999f:df02 with SMTP id
 af79cd13be357-8a8ea5951e0mr221839085a.0.1761707988386; 
 Tue, 28 Oct 2025 20:19:48 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-89f243142b5sm979056185a.8.2025.10.28.20.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 20:19:47 -0700 (PDT)
Date: Wed, 29 Oct 2025 11:19:36 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 robin.clark@oss.qualcomm.com, lumag@kernel.org,
 abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
Message-ID: <aQGHyN19/a/tl0BH@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
 <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
 <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
 <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
 <einog245dsbqtx3by2cojyzmyctk2fffpwndwoe24puwqq4fta@cu6iiidxqgr4>
 <0291d0f2-483f-48d8-8c75-f1bbcd1ab18f@oss.qualcomm.com>
 <ehgdx7av3jewowkvtsqrbnsphgxm5hryl6n5otnapi4xneldze@gcwvpssisv2x>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ehgdx7av3jewowkvtsqrbnsphgxm5hryl6n5otnapi4xneldze@gcwvpssisv2x>
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=690187d5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=dRtYTIcgi1dzbadgoRkA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: j2V8AIQBm0Odw7JYoiMi3iBBJ2l9qX03
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAyNCBTYWx0ZWRfX9AaHNBof0p/9
 gtIg/Qam5D3N34dtbqeeLzS+Pl/CLjTnog9odqfd+zmVMAs5tC4wuqqWjycjOytAvDVpoVMvc9P
 b8Px4s579Gj8x4dPDRlzNHwPf7QTnycqR5LnScTZTJrrACtuU2GEv+DwU+t29g4zSjLtOMLcPO5
 NJA1VEPe1njmyw7tGD1UEVMs7vapCrxD0EcPp/EVt8KWg9pjrR7EmgERf1ByXmhURSTruTtYhMm
 PpQg90yh3sQk956N+kbp3rN+j2qwUTG82AJGYnUQiUsbJb67AP+kytEoRMdHNaLJlUdvZDrcEee
 JydbwXQvVsaNAeJ3YTb4687CNpQQPf5iCTmgRaSkU7PFtVGvpn4dWlSSHN3QLiht7EdI3Chw0mX
 tw3NIyYuHIy2dlxjRH6GbaBBzqF8pA==
X-Proofpoint-GUID: j2V8AIQBm0Odw7JYoiMi3iBBJ2l9qX03
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290024
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

On Mon, Oct 27, 2025 at 03:29:40PM +0200, Dmitry Baryshkov wrote:
> On Mon, Oct 27, 2025 at 02:20:26PM +0100, Konrad Dybcio wrote:
> > On 10/27/25 2:14 PM, Dmitry Baryshkov wrote:
> > > On Fri, Oct 24, 2025 at 11:27:53AM +0800, yuanjiey wrote:
> > >> On Thu, Oct 23, 2025 at 02:02:45PM +0200, Konrad Dybcio wrote:
> > >>> On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
> > >>>> On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
> > >>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >>>>>
> > >>>>> Add DSI PHY support for the Kaanapali platform.
> > >>>>>
> > >>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > >>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >>>>> ---
> > >>>
> > >>> [...]
> > >>>
> > >>>>> +	.io_start = { 0x9ac1000, 0xae97000 },
> > >>>>
> > >>>> These two addresses are very strange. Would you care to explain? Other
> > >>>> than that there is no difference from SM8750 entry.
> > >>>
> > >>> They're correct.
> > >>> Although they correspond to DSI_0 and DSI_2..
> > >>>
> > >>> Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
> > >>> new features. Please provide some more context and how that impacts
> > >>> the hw description.
> > >>
> > >> Thanks for your reminder.
> > >>
> > >> Correct here:
> > >> io_start = { 0x9ac1000, 0x9ac4000 }  DSI_Phy0 DSI_phy1
> > >>
> > >> And v2.10.0 no clearly meaningful changes compared to v2.9.0.
> > >> just some register address change.
> > > 
> > > Addition of DSI2 is a meaningful change, which needs to be handled both
> > > in the core and in the DSI / DSI PHY drivers.
> > 
> > DSI2 was introduced in 8750 already, but it was done without any
> > fanfare..
> > 
> > I see a diagram that shows an XBAR with inputs from DSI0 and DSI2,
> > and an output to DSI0_PHY (same thing on kaanapali - meaning this
> > patch is potentially wrong and should ref DSI1_PHY instead?)
> 
Yes, I check ipcata Doc, I see DSI0\DSI0_PHY DSI1\DSI1_PHY DSI2\DSI2_PHY in Kaanapali, 
addition of DSI2\DSI2_PHY compared to SM8650.

look like I should add: config io_start = {DSI0_PHY, DSI1_PHY, DSI2_PHY},

Do you thinks this fix is OK?

Thanks,
Yuanjie

> Most likely.


> 
> -- 
> With best wishes
> Dmitry
