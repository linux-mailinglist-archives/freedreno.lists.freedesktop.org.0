Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 714C2C83FA2
	for <lists+freedreno@lfdr.de>; Tue, 25 Nov 2025 09:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE5AA10E385;
	Tue, 25 Nov 2025 08:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QXb7/Qqo";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U7SKITdt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5EA10E383
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 08:28:17 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AP2gg2E1979085
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 08:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=C0xyVDHLDCvMVkzkodB7GPpu
 M+6tZS/+sWy8NjN5kXU=; b=QXb7/QqoTVMFS/a56YPst9Cs45G/ycmOzegR32gb
 rWQa12kmCT6cGrdMZ+kHEMMN4Ap0w7gDfXrOB5gZATXx222rgvg2sMy133gXWaaA
 8Lqk9VXzbhPg7kAlOD6SMt5z5bivlWbPe2aigeZWCwrp1YXVxgCbB8L8F8KcmN6k
 +o3vCaJTJUa4WWG1hxDBY1Ej/v8rl0Wrf2c6E7GN3Xw49MHUqGJqviIOrZ9izXtC
 tJED0oFmECq0TJEzBtZR69XlYpRc1EvhwqcbiiZNiZdaTNAUJ+upBnwH3nion3w4
 daqjSaRuFYIPJcPJRU1v44TeKxqPYQ5CiQEyKC+XeW0+9Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amw9gsuwa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 08:28:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b2e2342803so1407966685a.3
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 00:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764059296; x=1764664096;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=C0xyVDHLDCvMVkzkodB7GPpuM+6tZS/+sWy8NjN5kXU=;
 b=U7SKITdtHOkqusHrTiLPWa2wyTdy2Zu4Vu0xb0JV6WfgyCoVMqGX3V7gYxZxGyhGKB
 hW0oRcjdKogtvqA7Svvn9Apb+NF8KKJ8yloIIqAxk3T505xIRFpA0pNWM+WBB2rX0N7n
 /5Z/8s0dz69OzJuJr5Wz27Me9q3GWc+pDgLdg1cMrpsIB/B5MklgrEG/r9U2uc/Q6WAU
 PnRZrhcd/H1By+oUg/Zd0p7OBgzKAzupVFj/R8iqI8v5OXN7ps+oTtAyTN079hUrCHYc
 fxhTydO9HMsXNmJMwD8iaQTSk5odXazebVNtltEQog2jgNkH83jAyzhv7fuzaqJ0vePF
 ksgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764059296; x=1764664096;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C0xyVDHLDCvMVkzkodB7GPpuM+6tZS/+sWy8NjN5kXU=;
 b=HjRXCUZp0z1Avz310f2M2S0qUDE8UwuIDf0ceS+4boAxyf3FicF99EbzO5W8V4VRB5
 VCN0XlsQ3uNuPmPS53cRfeVK+6nogT5nosdDY8dO3DpPm8luS5fxCkdk001aQOlFCFxI
 ya8T/I2hbk80JBXL5cFZBjVY1ZwqEM0NhyERNEpD/LbDZU+4rjjoyBni+up743/PLr7l
 jipx6Tvmyqex30BBQrFhxkPANyH+WQdH1Y+pJobhxO6YTxnlmFH1Qn6JFncq5UTrJxL9
 qL/Y2gytGla4aiTjiKXM2T9Ix09Gs3q1AmpKgimqphcdkHutP1MvdqXqHa59pJ8KOFpH
 PB8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN45fnQi6cAFsuEu8qB91shBJ3zso4G4zh3Kg+cao1culeOKRk6tWhFi1yTEAD+mbGGup2ZmPpX3A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvDIq3FplL7zvLBKhykvqsaa4vYxFbN3/5w3biQC9D7V3KxRQQ
 1fX9e9JCkZyhv446sjW4DF4k63NhypOSmYYUE0WHHCQ9YE4GK6PtZBiMWu9u7WVRD5ueCW+2tuC
 1lg/a+2aLOFxjmXGronN0/KutlAoO6zhNOGEdsn8zbTkPiEM2/La5rI1v9BC01FH3DYHy184=
X-Gm-Gg: ASbGnctwwl8dz6udxpIYxts1tf1NRHJXnCfUiCZfIv0qPnjADsocBG7PRHRfq3274tx
 I3XmhTnA6Dnl+OOjWs2O0eUns93dDG1tE1R1bJhhfjEBn2pBc7RmzylSistY9ZcxQI+hZ+sk+wq
 vBrtz5hmr7cgj2LDgqZC+nCq6zU1p+H5irrMpJicK/d6/16aJ2PN5iT+rsOZHlDAQFDhatzRYRj
 ih6oNEdt4yg+3U40OsiFxnFdSgR4C3ICNJk+8RPN+oTsP0yRmeDSBCUTchmmgpRWowBi4CWhAQ+
 lXglbXYRT1c/VooduLUpLsbnIXtSltXr+fcuLajmyr9ocANcHHfkBfaQ3GEadKtvHpctbPkDvE7
 C0G5Yzz2YBMPqKUQOphW7IEXZmaQHrgHqvcqT76e5/YovLzZvwDMrknrvyOxEr2hvsaH99C8ek/
 U=
X-Received: by 2002:a05:620a:468f:b0:8a9:b469:efc1 with SMTP id
 af79cd13be357-8b4ebd6fac3mr250223085a.24.1764059296554; 
 Tue, 25 Nov 2025 00:28:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGcN96mL/Mi34nfBciX8M+hnzh6AlZnpTJoX9gJ2nCN4RnvbdoR1QuCweSHuB3nSFJ2g4zXiw==
X-Received: by 2002:a05:620a:468f:b0:8a9:b469:efc1 with SMTP id
 af79cd13be357-8b4ebd6fac3mr250220685a.24.1764059296108; 
 Tue, 25 Nov 2025 00:28:16 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8b3295f17dcsm1112575385a.55.2025.11.25.00.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 00:28:15 -0800 (PST)
Date: Tue, 25 Nov 2025 16:28:05 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH v2 04/10] dt-bindings: display/msm: qcom,kaanapali-mdss:
 Add Kaanapali
Message-ID: <aSVolV1gkWRK6Slb@yuanjiey.ap.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
 <20251125064758.7207-5-yuanjie.yang@oss.qualcomm.com>
 <2f7aa593-6b11-4dbd-a0e6-f60eee16d7b5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f7aa593-6b11-4dbd-a0e6-f60eee16d7b5@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA2OCBTYWx0ZWRfX3s2toeZiIgsI
 6qLHJYKrgj+BL+HakJHsIVZzcKWlrv79HsgIV3hHORijYK8IzmVd95zPtMxkIr6Q+yxSvb38l9H
 7+r0njJyTXUnkpvc5qGIrST79dSXD4hssGW90NZqz5glvD8rh9aWCH66QoF7jCs+AhifYpWk5x1
 jwqOFBvZfHJ3A9eXsugIhpTnX81MPo/oNQW53jxqNOHLrY+Cfpfn93PTuoTVkjFo/rC+a6IwxZA
 +t5aCU7EMmVoC9DedZMjuqwN9hJVcy3Q2GyjIu2MxA+N0iP0FwL9b96Vv00C300CQ5DPNL5t+b2
 d7UejlRJuKoWc724gbPdL+VCynESyCucjFZT53qz6uvVASN7wo9919sQcRV2eODDL8u9k1LUjRp
 Xmfp1BhYbS6xx38SU/GATe+XO1dnMQ==
X-Authority-Analysis: v=2.4 cv=H53WAuYi c=1 sm=1 tr=0 ts=692568a1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Kua_XrAaXZ40T8CRvF8A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: MUDyqre2JHbLA1xL8NOoe5pZrRjKy6fb
X-Proofpoint-GUID: MUDyqre2JHbLA1xL8NOoe5pZrRjKy6fb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250068
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

On Tue, Nov 25, 2025 at 09:17:50AM +0100, Krzysztof Kozlowski wrote:
> On 25/11/2025 07:47, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Kaanapali introduces DPU 13.0.0 and DSI 2.10. Compared to SM8750,
> > Kaanapali has significant register changes, making it incompatible
> > with SM8750. So add MDSS/MDP display subsystem for Qualcomm Kaanapali.
> > 
> > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> 
> I don't understand why you have random four quicinc or qualcomm.com
> addresses not related to kernel development, but you did not include
> necessary addresses.
> 
> Please trim your list to only necessary addresses.
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
> 
> Please kindly resend and include all necessary To/Cc entries.
OK, will check all necessary To/Cc entries.

Thanks,
Yuanjie
 
> Best regards,
> Krzysztof
