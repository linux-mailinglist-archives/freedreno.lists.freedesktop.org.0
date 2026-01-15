Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E75DD28A4B
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 22:09:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE11B10E7BE;
	Thu, 15 Jan 2026 21:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cw33jvOF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tsk2QYB2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8340910E7BE
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:08:59 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFfx5K2312097
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6CWr3YpvoBVCcskN6Xk0YpfdI325zkYISzpPc59M6Gg=; b=cw33jvOF2Hsg9vg8
 WObtnG9h/BL8Lt0TAyJT1iBhMAaJ/j5DBMNABjIKQ6QbQF/VPDF+45cNvPcXOzsP
 ox/zvf1RMn9QcHUSUtLg2U+D43Phk0wOJLM9tvCUBtPNdG+NIlyIrZUr6M9Pn+iA
 X8MTuK/w233EW6fqMJTcLbY9xTS9m+cTNbeeaunn3ObwKEjDLnCw3HplLAc1JODa
 l5m2MFfB7X74HFS7UZ5C5P9KwAtxZJqrszhv/TqvaOMtUqrn57Un1Ti5ADo8O3wJ
 xerSO4iLQaH7BSXj/lLve9fuvqvkmm1z/KgqveyabIy7RnGM2Ng3nCc7jiEq8/kf
 UkQ3xA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq340h3au-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:08:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c52c67f65cso506575585a.1
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 13:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768511338; x=1769116138;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6CWr3YpvoBVCcskN6Xk0YpfdI325zkYISzpPc59M6Gg=;
 b=Tsk2QYB2R+bMgBtoccAkv7O71dEixFSMl4+URqN8fswepLsu2DLSaoP9BhzLAN3J+r
 Q60zxeLeqkc1u/ZlATDe5NR3tIkTdc6bpADZwrbfFSgEKFRJfnvSeai5grmW6VNyzIba
 MTjxhW6TlxaXAGLhL5iA2wMAo8uYCHjbBlufBjj8/fwYDByMu0NS1fgDbhOtZ0IWeZhm
 AI2xsMCTLbHwTLRzobsfIpEqOse3CFBpjTHNijLfiQyfEhfzKTN8KdlY37LIPghAqLJU
 NkLHXj8yTOHUPP85hI5c21EJP7i3kCgYHljqILmpvBg+pFIUi9zuZGOWljnFAKPbbVGc
 sgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768511338; x=1769116138;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6CWr3YpvoBVCcskN6Xk0YpfdI325zkYISzpPc59M6Gg=;
 b=kvmH+riVEOlv4KBVdgQxOe4SKmEOSYhSW6XIVRcrZJq5C5dvx0cfdk3NphNU/pndbY
 dHcMs2Q/24WA7yRcDBzNo3a73ZoOI7vP5A4klLhs3PTOanR1sZ2kkT6UF3pNoeiO8Mcg
 LMfxctGibLkJsGqKqj07/uB/ItTch99QJ1mQG2BdWpHVYoNCQ9vRXcBWALRSN8u4xY6C
 WNto1jQCtwD8/WU9Fsu1eqUvkDhpoae5RCFcqsGFKPAmQdARW0yLlEjH/Pf9MfMUAD+j
 r2JOgOrRzJpP6dHPcuBow27O4/J3SZUmrvqh9+L6ZaLkuaWIEjy0RGZIIk1aCs1sEKnM
 GwFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFnH6lGPfUYGnfvqDTGu/OzoePTkAr+bnliNAnZ20/h49846tmRMZPur9ONshM9rvegAM0y2IXo2k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLTaGR+kM7FRWVDPLyuOyN9jfsTwecssv8iebO+pgZGiRmyC6s
 Xm4w68W5es2qYCH9p5/NSJTkO3k931kgCilS6eCEqaBz2chz3PTCAvhhgexYS3Tr/GpH4y8zMNl
 UoL1HBKx/Cx0bmIHLxnhuGcMSBeA/jGuK9c7XWVYB9rSUBVu3VVwY3piIXwk2F12M4EVtZXo=
X-Gm-Gg: AY/fxX4HnX8QtdpbP2RzEXDpnQRrFqVXK9BKTyp/tQ4f+6ng4/lnWE/Ky6BqjFbNUtM
 LuKb38IHHTdmwzEkoR169TO/eB9Ids+0eT4unl3k56DJamZTrlb+4CQ9KpZ5htRY1Az1DgsRbzB
 7zfyBAwXH7clqDET+40YTWz71r6QvEZuKpx9l+TA9Kn3znV/fpuzqggqEyx4sAn+pthZpZA9pNW
 z4gUkUGoh1LZ6cQZ/Rvi2UoCBOtUmrxoKL4Cf0gmaFPLCsdW0FiMXgHJ0nTEDmv7Eyol3kPRfbc
 c4HlANzwqzS1/eamYf1EQn25eOIKOkL8NOSNfJ5v43qPrSzyWrMenGVaVC+1QKOm+gTYUPBJQV6
 pk9h6MFWVxjhLlKYyIz5GwGWR7osCC3bMJpGwyZPew54NMVn3FnidQrZwXKuiSjdVd/uXzGLC79
 4xcQ+nYS8nhTkyt95y8y3EhbY=
X-Received: by 2002:a05:620a:29c5:b0:8c5:359c:2821 with SMTP id
 af79cd13be357-8c6a6944eb4mr107585885a.42.1768511337902; 
 Thu, 15 Jan 2026 13:08:57 -0800 (PST)
X-Received: by 2002:a05:620a:29c5:b0:8c5:359c:2821 with SMTP id
 af79cd13be357-8c6a6944eb4mr107580485a.42.1768511337300; 
 Thu, 15 Jan 2026 13:08:57 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3a1746sm154628e87.91.2026.01.15.13.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 13:08:56 -0800 (PST)
Date: Thu, 15 Jan 2026 23:08:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Xilin Wu <sophon@radxa.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Filter modes based on adjusted mode clock
Message-ID: <iqst4yq3z5jlpr6f3r7fqbkzaxtn5ugene2j7tcvaa6jy2jwdi@k5zgxvqgxymi>
References: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
 <F4CDF36128041430+0d030e3b-054c-4910-a132-72273c541948@radxa.com>
 <caf44ce9-48ec-45b4-b633-3a49b7705b1e@packett.cool>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <caf44ce9-48ec-45b4-b633-3a49b7705b1e@packett.cool>
X-Proofpoint-GUID: i2DdNc566AZTVXUQFHrHcYSztHcZ0AwL
X-Authority-Analysis: v=2.4 cv=bp9BxUai c=1 sm=1 tr=0 ts=6969576b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P-IC7800AAAA:8 a=e5mUnYsNAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=NaFzL-Qi7nr1PL-x3w4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: i2DdNc566AZTVXUQFHrHcYSztHcZ0AwL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX7zyZYEDwW9Ko
 FbQwa/1Dc/C/gp4om4jj0vfJfOb3wk+an1s2JCIGZ8RxnZRIQbNFRShZRKEgZhVHq+h6M3D4xBa
 2OOXNqSQzSKUZ269T39Pd1Cdbn+tPhb5kaPb5t1oQxwN7+1wO2y6mWTA62QZu2SlCYzrrxPT9PV
 Yop8+51ZcVzpo9uMOMbWN5VGxFkEsfay3WViBfDaSkJxWD3zrtJZfrSyYkThXx/UXtuidk+lbY/
 y4RKKgFqws3/XDcO+3vyHSZgt2FqjQdGf/empjB00TLW+McdX2AmoCiBr1Vk3uD/TG3g6tBun9s
 ubvnynXDdjPxpWVSGTMuS+qwkbhb3mRXtVYvnrwXpWLjQ3Z6mTavaqYoQlROQADMSIvfxU/aM3U
 /Vu7WaXHKhIxJy45yGo5baGbs0UsbRL+s9BIYhpN14GfgxK8ugLweUf6WPcWTc9/GiCjNbr3Q6/
 R74hJXSoaQHsCpamoJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165
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

On Mon, Jan 12, 2026 at 04:54:28AM -0300, Val Packett wrote:
> 
> On 1/12/26 3:31 AM, Xilin Wu wrote:
> > On 5/7/2025 9:38 AM, Jessica Zhang wrote:
> > > Filter out modes that have a clock rate greater than the max core clock
> > > rate when adjusted for the perf clock factor
> > > 
> > > This is especially important for chipsets such as QCS615 that have lower
> > > limits for the MDP max core clock.
> > > 
> > > Since the core CRTC clock is at least the mode clock (adjusted for the
> > > perf clock factor) [1], the modes supported by the driver should be less
> > > than the max core clock rate.
> > > 
> > > [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83
> > > 
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > ---
> > 
> > Hi. This patch effectively filters out the 3840x2160@120Hz mode on
> > SC8280XP CRD. The calculated adjusted_mode_clk is 623700, which slightly
> > exceeds the supported max core clock of 600000.
> > 
> > However, 4K 120Hz works flawlessly with the limit removed on this
> > platform. I even tried connecting two 4K 120Hz displays, and they can
> > work properly simultaneously. Is it possible to bring back support for
> > this mode, or adjust the limits?
> 
> hm, interestingly on X1E80100 we didn't hit *that* limit,
> the adjusted_mode_clk (576318) was only above what disp_cc_mdss_mdp_clk was

Hmm, what is your modeline then? Xilin's mode params looks sane and
standard enough.

> set to (575000), and reducing the clk_inefficiency_factor from 105 to 104
> was enough to lower it.
> 
> https://gitlab.freedesktop.org/drm/msm/-/issues/38#note_3216051
> 
> I guess it's also sink dependent, like if the mode for some monitors has
> much more front/back porch etc.? What's the entire modeline that resulted
> in 623700?
> 
> ~val
> 

-- 
With best wishes
Dmitry
