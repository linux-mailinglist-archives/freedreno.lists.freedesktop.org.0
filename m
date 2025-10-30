Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF1AC1E22C
	for <lists+freedreno@lfdr.de>; Thu, 30 Oct 2025 03:33:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F2610E230;
	Thu, 30 Oct 2025 02:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KqLa576G";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IRsMrKea";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A909310E815
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 02:33:27 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59TMSX6W570118
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 02:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ntHK9vxhminoglXJfxZX7o01
 Uc8LpengHLNaWyUigT0=; b=KqLa576GQs2Sl92ylUs7z3iLC7DxRQ83BJQ3wO5T
 CMRGAlL/E5pXBXJdFvDZ61vloRvIKLWoOomhGALMgT4ibA/PZP43eStYj9YqYmct
 cqpesaP4pBoc574NM8I/JNjaSbFm/DTRTWJjCpcM9ZkGVyEN2+H5EpV6CAuVJSHT
 kfDI+XI7Fh5iqsP8AVgRuZKoCJr84QjeI1YPWqTPCeHvjcDCCtkmoYE8H4zWFsKS
 U4vIEB3hqq6TUgP3pyXnigJ8NyJPfV+wvMO42Jj3gkAgAG3i/pkj8EPue2KKwKxv
 aK5e6s2znwbo0VsbvyarSvbk7BYiRK9H4KDCtpFr7Xrc0g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3m0bj752-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 02:33:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e8aafb21d6so13731251cf.1
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 19:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761791606; x=1762396406;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ntHK9vxhminoglXJfxZX7o01Uc8LpengHLNaWyUigT0=;
 b=IRsMrKeaM64fcehsbLTavCQR27qAfAlNigAmJAYofdA0qEFsVJwAJ6q/ldbhhLoZZA
 s4rrSiDoeupjT6Zcl2cZukZOLpVq20XsaN/exl1yY8ZpN+b3m7AHXcMZLBgGXQ46Ffwu
 0SF4pV8coORzivkSDG3bIZjmvZnJG4kAU781d3th1JI2c/9hBKebN/3RL9dvd7HEh8Qr
 IasjVgqpFWRRbIKVNzpS3le0G/qv9pdPevhxqM60Ov80ST+D2ziifUNH1YuevSB9UNJf
 Kz/QXE61msCoDJLGjgyTTk6hR825Ej9EGpgIyJT6tBQ9jJyFUfe5dQZ1t9GtCue01Hot
 3wcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761791606; x=1762396406;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ntHK9vxhminoglXJfxZX7o01Uc8LpengHLNaWyUigT0=;
 b=F/wlUDrlchsIyrdiL4WAZwcBCDDlEBPYB3+J177yDcHafuI1A8d+21dOiqGf2CsiDY
 pQ9iGkR40i7qU5y3CQ0WysihIwZhUGDiXEJol/xhkWUVN66fEZ17Zn6mHWz2642AlzAv
 AAbzbhyxCH7GiJuyVcU47yzFF1upeWtrIEx0s8x3g9nAqfRolP4e3DGrJqYgdhSJMi3N
 5xZaYSvW86NpjGqAU+WAJ2cSogUR2ytrGaMvjRsPaBxJ0VaIQTfx6dgvQ8HgDd1SohXT
 1bHD3TvHkS+b64GbP5PUiPtphHfHM9XNMQK0itqN1Nrz0pF05fyY8cTGFnMn6Ota5Nsy
 CfYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdR3SyAiMObIAwr77cfc2YFVgr4VY2lMUIHFNBuk6O38iYlrP69peaIn96Il8+QhYJ3mO/YgCmLHk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yze6swJiiCoh4Z0xvUmP6Z0dQ40kgRu23LG5BCUGgWLtBRyYtS5
 Fs2mrvYGiq7vyjEhOg2wDYMpY2ZiWt6217Hb6oV/wxJEMsghXQDpuUNFT2Cxzg5SiQ6V2y4co8F
 HUQH3Lw/RDdmAl+ZlInQO1LH3xvbepkPl/N6YKbLJTJWfV1soWuJzraCL+j/W3pREREJehaU=
X-Gm-Gg: ASbGncsjzldewRToxdPi/NYU8gZaq14EUw5RdEy7IHxzBJI0l+jU8Ru3j6mdzwYVlS/
 Ck6NW/LqBkyu6k3z3Ih+VaykU1Uw24R4K86HFC48oBBBW2RN19r/Lop0PSp7vwSkrmk3UJ+TjK1
 BYNr+uuHkapKuOHEV9eGKt8IUT9okzMwrn+7jh8OC/51eBX58GDQTSqWFc816S04x05g2EJ0kAe
 CZM5gtgYAy+TaMG1uRSCKK1BNIIp+mE9kHpotabeC/YvBodXZsbKVDCusrAU+njNUAvmqdeliWr
 FZswOY8VHKIlyv7M7T4dXTpSKXwu/0jLzaOWN+HntR5sxIJ65fEo7rwe0MuZ2RzXDMeT/VK7Nog
 spj84rG01z3zBQQnhP7lYBMfpb+zwap9oHm2g2d+QSsFOMVT1x1Ym1Lf9jprt
X-Received: by 2002:ac8:5acc:0:b0:4ec:f9a1:17bc with SMTP id
 d75a77b69052e-4ed15bb1f61mr53768261cf.5.1761791605777; 
 Wed, 29 Oct 2025 19:33:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH62Xw8UczlTHR5mIibSKtnyEtT1gApL84hMtZ++sQ4IY5il5n+hfMOijT0cJsyTI5gYuh+Ew==
X-Received: by 2002:ac8:5acc:0:b0:4ec:f9a1:17bc with SMTP id
 d75a77b69052e-4ed15bb1f61mr53767891cf.5.1761791605240; 
 Wed, 29 Oct 2025 19:33:25 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4eba37b51c6sm103962621cf.5.2025.10.29.19.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 19:33:24 -0700 (PDT)
Date: Thu, 30 Oct 2025 10:33:12 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 08/12] arm64: defconfig: Enable NT37801 DSI panel driver
Message-ID: <aQLOaI3ngjswi7kd@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
 <wuh7agcgg6spghilnx4amqukaaydj25u7kbdiod7fl6pu2ulvm@pmosyuo43cyw>
 <aQF98RvLuOlJZlFi@yuanjiey.ap.qualcomm.com>
 <38c8e26c-08a4-42d9-8f6d-93969af90d50@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38c8e26c-08a4-42d9-8f6d-93969af90d50@kernel.org>
X-Proofpoint-ORIG-GUID: l-ldJl3yhS2Fwerme583M01tELo2idhD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAxOSBTYWx0ZWRfX4JDvtV4FsT2Q
 qgp4dkg44w+KIkhAZ0liGSgiqIlraPaX+xXl/a5oy9eQO+jGOKEeaf//rdTlBLPkDb/yM35uTtU
 kQlmfXDRqq7Mj3fdhqQvPYqPtEYxt8sab8sfVAqnYmKhr+zrjRjPf95a3DE1eWKL6+/1QijYGfO
 ifUKSB9fwV9cuaG/tlBgtxNV47wNVcQ4grPTzKKKwnGkXQqjAY9dwcOseou1ktg3rsqnF3QLxTa
 gbUVFMrGpc+Y8mekz1dvBA2YPFLsXuGULKY5veuduw2HeEfSH2GXsOx3Gt/YG+9H6GsC2S1QmtT
 bpf1hKc+/Rw9BfrnWHmVfiZCVTgGlBeYpBEaq0lx4bwvFqlFNZOsB5DXj47OOpXFgG79Ym8/Yhc
 TTQGjifH3fcunnVIpRCg4wl/2zecyw==
X-Proofpoint-GUID: l-ldJl3yhS2Fwerme583M01tELo2idhD
X-Authority-Analysis: v=2.4 cv=YLySCBGx c=1 sm=1 tr=0 ts=6902ce76 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=n00Os9SHjSpe-nC2C8wA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300019
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

On Wed, Oct 29, 2025 at 02:05:20PM +0100, Krzysztof Kozlowski wrote:
> On 29/10/2025 03:37, yuanjiey wrote:
> > On Mon, Oct 27, 2025 at 10:51:23PM -0500, Bjorn Andersson wrote:
> >> On Thu, Oct 23, 2025 at 04:06:05PM +0800, yuanjie yang wrote:
> >>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>>
> >>> Build the NT37801 DSI panel driver as module.
> >>>
> >>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> >>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>
> >> You (Yuanjie) authored the patch, but forgot to sign-off, then Yongxing
> >> provided certificate of origin, then you provide certificate of origin
> >> and send it to list?
> >>
> >> Please correct.
> > 
> > All the display patches were jointly developed by Yongxing and me.
> > So every patch 
> 
> 
> So two people were working on this absolutely trivial defconfig change?
> I have troubles believing this.
I want to say these patches I am first author and yongxing give me support, so
I think yongxing is second author.

I want to express my gratitude for Yongxing's support in every patch, so I included
both our names in the sign-off for each one.

However, if my intention causes any trouble for maintainer, I can remove Yongxing's
sign-off from this patch.
 
Thanks,
Yuanjie

> Best regards,
> Krzysztof
