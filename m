Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C430C230F9
	for <lists+freedreno@lfdr.de>; Fri, 31 Oct 2025 03:51:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F7010E188;
	Fri, 31 Oct 2025 02:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eveHNNsV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dbgz7UaF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279DE10EAAD
 for <freedreno@lists.freedesktop.org>; Fri, 31 Oct 2025 02:51:02 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59UKeRHu3281442
 for <freedreno@lists.freedesktop.org>; Fri, 31 Oct 2025 02:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=DsJkS4Jj0YiOEfhK6rX+s7mE
 DdCGFC+Wm4+5HWL4rHQ=; b=eveHNNsVfcKDk2mAiXSreXJVEOwKUUuuY6Zts5Tr
 5AESW65mOBYtL7nwuX53K71yGXaxATGqw94J3pUygtlsJHBtQs81RuBEqqXujSe5
 HaabpV7FW9xwhAFIua679dZMrJ33wNgs+vyLMF217YN3vM0pgUl7AMiW04OYP+i4
 AbiiIOFpB0+ukr/+mnEcD/OmcjcNfZvn252BCCMeo8q1PSXQR3sj79AWm0IW6O54
 H3dFQj8yPtcC5X6W2BOPbu8TynatIJn1AdVwX7w3PQikCgIrdyFHyXmmZnAub0C+
 m1udYkR6Upz9OHJhQyQsc8hczsbEEAZYtUYVZ9xekJXoDw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a468kjf03-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 31 Oct 2025 02:51:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed240c3d93so14885741cf.2
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 19:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761879060; x=1762483860;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DsJkS4Jj0YiOEfhK6rX+s7mEDdCGFC+Wm4+5HWL4rHQ=;
 b=Dbgz7UaFl1MbcqMdHEfZlUkpeRro04Z9g6c088qlEh55GIjtzelq3drLVkAiTFTxDb
 DxkrVMy/tuD4XIzXnKsJ0yXywuAyORy2Qkh1N1mo9mx9MRis8tbAbKgsCvMkaES7EzuR
 +wbJvjdDnBrwmiIfBf/9kEGolhe55E2Ui2i8ESW+flHMXV4QJdhlwOfrlSPMeDVy7+9H
 rLU6mH+fQ6iX184zjys+VxQgbpc8bgp0lAPUctpw+XlmvEqogBnuNS7qz8rSz78+n2+f
 LMqjvvmV5HNCTJ4kYddjW42a3Hao5fsYQjSS/bZcPHPlyIFgMmFI3YpdkgYZ1xghsAYx
 7y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761879060; x=1762483860;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DsJkS4Jj0YiOEfhK6rX+s7mEDdCGFC+Wm4+5HWL4rHQ=;
 b=Zo6U4ILzcCP8+260mPx8idmibA24gRmEtAY9SZXlChJfaW6dd7rmx301m5jl+1wDy2
 GZB0YdAkykspsPnj6Kq19enqjl7dnRXw5/CtD5rAIVURFNKUQVKxWV4wNMl9W3eDq8ak
 vGLXSiqGzQMJbxVNofs2Cp6GEf6e6GGIc7qRxir2uRroeXRZdQa5SmYaaIwePtEjlCz9
 mvAJJdnddPYTAogNgTA8FwWPUWeUBP116SCy/ujaw6HYSo9HGQEZuKs9pTl9E0cQXdyM
 EL7sy4JlmRVw6+somgRTB62z98SI3bkNP6Npqio2sOfwWUZl0tagCcDxPXg1QR8bwZA/
 LdNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2fetBjUhlFL9DGPnuNeZiiUKtbG2cSjp1uHcD1GsA/qovictroun7ykFm8iqUEOygeC/0FjkIAn8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCyYWjJogpQ1B5KRP0tvf/SET0n+frt0ow5uxgRYs6poQqHbbK
 lBCOl1d59iaKiUDz9rrp1q97b7zwBRAYfupUVjnKciynu9s+6I1Vgyx6PIMjNKjgpGFvcTr59IT
 oEqbhbIxtnEQX4nbksbaClFrzuyrEHiT7yrJc4PRJX7CvvVO0YGbvVNo8Q13zDXVqz9769TA=
X-Gm-Gg: ASbGncu8st7XmCJNLwgiahZLVOkF72IglNUNhtZx2/FFeTcy28gH38F0bYneTFNCDo6
 rfnAkqVlSzJINusFuiXa8F6PosPNIDGppEkXWW/aJFte4iLjOLDxFWs2xG5Mmre1qvq4EpzLaDU
 Zpue3i1vMR8OogaL6vk9pHMc8qUF45RxqL7Rjwjx4K7lM5KZh1YN0sB+JUIYUByxaAV0sxk4feQ
 XfRFIUZwNd4gOmWr/WYLpRHNapnogyxZQrMgG6fuWSQQgaxVCGzpqZiA7miNKfAnxcGxqlYh1GS
 MhatVMCsKDeWUHpJql2S1LckEd1J0qRIlHldF0+kHxivSxRZ+MULbAwDRy6FKs/Zm0YYk3BFO33
 Jtruf1bn7bzUQ0RF+UT4jCAL7SuxtVkt6kRShaok8c6Vx5tVimp0qN6EKCp+v
X-Received: by 2002:a05:622a:250f:b0:4ec:f5cd:871e with SMTP id
 d75a77b69052e-4ed30d84c4dmr24792601cf.11.1761879060395; 
 Thu, 30 Oct 2025 19:51:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXYqZxTVqoWzxiWk3B/+KdG7WVS4s1P0rx3pIBR/sRe6vbtf2x7h6Rv+eqmkdkShyGqNrA6g==
X-Received: by 2002:a05:622a:250f:b0:4ec:f5cd:871e with SMTP id
 d75a77b69052e-4ed30d84c4dmr24792241cf.11.1761879059921; 
 Thu, 30 Oct 2025 19:50:59 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8803606f2besm3522226d6.23.2025.10.30.19.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 19:50:59 -0700 (PDT)
Date: Fri, 31 Oct 2025 10:50:47 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 03/12] drm/msm/dpu: Compatible with Kaanapali interrupt
 register
Message-ID: <aQQkB6Ma2z3c6iyh@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-4-yuanjie.yang@oss.qualcomm.com>
 <nfekr4vi34ftxzyyf5xv4tsb5cr3tokiyfkerypqjf26dos3uq@42wcn6ji7nnb>
 <aPrre+WXogSZIE7L@yuanjiey.ap.qualcomm.com>
 <st53uwtdow2rl6bvmfitro2dmodxtzfnhyzon4xeeetkkwekxh@ewlzkelq25wm>
 <aQGAvLFkH80Id3p3@yuanjiey.ap.qualcomm.com>
 <br3aukcmx3p2mtowqglcuf77s5xfnfv3eisjexabxhjzigkjno@wk7sqptjn43a>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <br3aukcmx3p2mtowqglcuf77s5xfnfv3eisjexabxhjzigkjno@wk7sqptjn43a>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAyMyBTYWx0ZWRfX/q+Pt+kUTpSH
 8d9JxKMsMDxviKWysMT7pC4pxbUHXMPGBpdMxcLuxMi+pT5VGA2wnhONrWAU0Edr4fcBaHVRtkq
 MGme/RFiuMTSZYqhBsVD+AqQ+phoApA0OoRnczVfZ439Fj7clwLlzN/9c8V3r+2BQijX4UDIJr0
 7hEnop5HUIVCbo5Al6RF42yfk10fztYWS20xCmI5ukLWc0hARc/FoIBa9FxgyGZo58f6u24eoQf
 jkqHawQJetsCAjayjC7+VrvFvAspiEQ6+TBnjm9If/qiSYxE9Gp3kF22M6zJ6GbDUWkgC4aNC84
 pQU4ubDepWBtzWOEoABe13xmLEZEROE4CyK+/mIe8eg/cG3ExRvGL1bvd7kjiTKzAlATLOPMHh+
 p5A3nKDPf59cJWJc22snM4U9/JkWQg==
X-Proofpoint-ORIG-GUID: e-jUOVFO9CI35LcCEqTozYbkI3asgDe8
X-Authority-Analysis: v=2.4 cv=LoWfC3dc c=1 sm=1 tr=0 ts=69042415 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9FCQf4pbOLePcO8AN0IA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: e-jUOVFO9CI35LcCEqTozYbkI3asgDe8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310023
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

On Thu, Oct 30, 2025 at 08:02:13PM +0200, Dmitry Baryshkov wrote:
> On Wed, Oct 29, 2025 at 10:49:32AM +0800, yuanjiey wrote:
> > On Mon, Oct 27, 2025 at 03:21:33PM +0200, Dmitry Baryshkov wrote:
> > > On Fri, Oct 24, 2025 at 10:59:07AM +0800, yuanjiey wrote:
> > > > On Thu, Oct 23, 2025 at 02:59:12PM +0300, Dmitry Baryshkov wrote:
> > > > > On Thu, Oct 23, 2025 at 03:53:52PM +0800, yuanjie yang wrote:
> > > > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > > 
> > > > > > DPU version 13 introduces changes to the interrupt register
> > > > > > layout. Update the driver to support these modifications for
> > > > > > proper interrupt handling.
> > > > > 
> > > > > So... Previous patch enabled support for the platform and it has been
> > > > > using wrong registers for interrupts? I think that's broken.
> > > > 
> > > > I want to express DPU 13 has different INTF register address, so need to add new
> > > > interrupt array to let DPU 13 interrupt work fine. Maybe I should optimize my commit msg.
> > > 
> > > Make sure that patches are structured logically. You can not enable
> > > support for the hardware if the interrupts are not (yet) handled.
> > 
> > Kaanapali Dpu interrupts: 
> > INTR_IDX_VSYNC,
> > INTR_IDX_PINGPONG,
> > INTR_IDX_UNDERRUN,
> > INTR_IDX_CTL_START,
> > INTR_IDX_RDPTR,
> > INTR_IDX_WB_DONE,
> > 
> > are handled by irq handler, so here enable dpu_intr_set_13xx. 
> 
> You have enabled DPU 13 in the previous commit. And only now you are
> adding support for interrupt registers on DPU 13.x. No, that's not good.

OK, I think I should merge this patch into the DPU 13 enablement patch. 

Thanks,
Yuanjie
 
> -- 
> With best wishes
> Dmitry
