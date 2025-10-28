Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30632C16B24
	for <lists+freedreno@lfdr.de>; Tue, 28 Oct 2025 20:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32BA10E06E;
	Tue, 28 Oct 2025 19:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="V0SdCCTU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J04HkVbb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F037910E06E
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 19:58:35 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlJ1S2502716
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 19:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=HC9tpIvHIz6+9K+gz/rNc72E
 qizD+nH+1zUVfnpz0Z0=; b=V0SdCCTU36+HZCsh/6WlYGSSvqGWix3hPXJpsYgr
 +qawP9qJ9Supln5gGBRWA4Eq7MvchO+uciBGQdlAf2u2TDo9yLEj28P9S8RJ7o5Q
 QuOCnNoZs+UxolxPzd3t1KMRAhCIomS4h7aYLzjDyTAfMRpBWZqh5N/YKofNSmAx
 rN6vcGwe+VKVRQbzwaqNHZ4zSF+G0mbNn8pJ20Ju+mVsHeKtXhvKhH44SIHXu27r
 HYs0gyWsrOAX6EDsrJRkMG2rXoVY/oEQ1vaY5O2X7dl/yA3+RmD4Xg1bJWdQ0v3n
 EIbVzb1oY1hko52mTM55HuMHBHQekZ6Zdb9zTU1ubANTTw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1g0sb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 19:58:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ecf1b7686cso7481791cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 12:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761681514; x=1762286314;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HC9tpIvHIz6+9K+gz/rNc72EqizD+nH+1zUVfnpz0Z0=;
 b=J04HkVbbFAd9CGmQG7G98JkD/dKp2J/tbydhPCsRJNwp9Ig8fqWbvVhSPj1uCfYWO1
 BciVMnRMolNFyDmaHCN/a35u2wv7cCubuu9TLsbEpAwe0dFUtCudWnrvOEaxO3iiT790
 UIjwGkO6GgLkw+omm5sI6UcWztY3Dk/X7mWUsnh5yL5QYHIeZYUYT4h4eoifBcsSvD9k
 XfEAdaptts2zaPrXtTBFYP6YMh7MKgTzb869ffmDzy0M2Xh0FdftRpCGPt+kwpRAjF34
 dQ50e9yoK0h3E5bBa4THb2My27hIgZ4ld7UHh5JrXUCvsNU2n617opN1kgGcHbSsym7u
 40/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761681514; x=1762286314;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HC9tpIvHIz6+9K+gz/rNc72EqizD+nH+1zUVfnpz0Z0=;
 b=QCE5wEWJLv2fAnnN2fKblbXbegLg1zqTC7XlBxetXvkVeWFU8EU4wYW3bC7gdwpePd
 WPbbulieHzYHp8nmARfVT3SAgITKyjxZycgT0EezW0WCH50rgELNgpsuK3c/fuSc+KDK
 4XYpEBNAnMjiAU+wjA+0t5Ten8ZAgNknxp0i08UzSpmsApjuNaa7PcyYCZnoGcFWvgSm
 C7ay4BIHzMFr1TTFp2Bvv1NJE4AqKG0wlWr3JM7Fl6qvwCgUNGEkPI2uLovbwgLqp20y
 wRiZXfcfl6mMgDidIN0p5flHjRxCzMJjbAMXvEPUMHKZyxi8xarQDt09LlqGLOr6Ya6Z
 UMTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQymQQpP5KoKWPxG8SaMa2a4RamltjBP9kiGEV2YQ/1OHWWWXSn6Kc07LuiEO+94NKAd4dbzy/3TQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjpvVeiE2Sfc30+2UsAf268qg74iZRJZM+Qn0JNlb89YK93HFb
 FQBvtUW4Wa80NwfTbbusLI+lizezonoOZP/7YafYL0cjOidARRck2nLBXbKn5DWu/Ee1X3q/FFq
 8ZQ4z/+489Hv/hkwacV6ss67mC/KTLH7DKfRPMcM9lLqEL2vL0i3V3mgu5jLg8Hj3GfEcmMY=
X-Gm-Gg: ASbGncstuie73gAqmAhKioYbKFqxoSrAAg1bvHOLieAO5rxs/tQaLUYjM+ZqQ/4nlSM
 aBS/MlJ4BZhVKl92dIAWiYJzng4RfG7rOwKJcP5HWECOPApJBbEuUZaCw9xcZoJBiz2jegj85kh
 trQPbdgxCASaDmytTvVSOLRbeqzfOgOJz2ij3+RWSk8/zDUR5k4CKDVicJCN+0e4hEMF+fdsgjv
 6AFQPMDJ4VZQCAFDafr7NSbHUP8Rt4Y3Vd1+CI/uYpC3A+on29Y53rTwXXAWhCSKhgKq60QGyFj
 KrKNwmnBXfDsp7DU+JBMya/fPFqvKwlxzPT+PXUDz4ae9zT/VIJJ/DmuO1+C/f2cbyHj+QLWbZs
 We6YmxbQeFGQYaTnxzf05y8MEEFzquE5YXvz+CMA3NsWoP9UJ09RiZkhGBhtB3QoaSd6uf2sEDf
 H+wjrpsSv/PQmO
X-Received: by 2002:a05:622a:346:b0:4ec:f2a1:5c9a with SMTP id
 d75a77b69052e-4ed089a8095mr48571451cf.13.1761681514462; 
 Tue, 28 Oct 2025 12:58:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaMmcLeIcEWm2PB1CZcpPJ3nfsaaOwDHDWrSPxIXsesjcRBn28xpDk5g3XqlOxBTccXdasMQ==
X-Received: by 2002:a05:622a:346:b0:4ec:f2a1:5c9a with SMTP id
 d75a77b69052e-4ed089a8095mr48571071cf.13.1761681513956; 
 Tue, 28 Oct 2025 12:58:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-593097eb2d4sm1632173e87.66.2025.10.28.12.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 12:58:32 -0700 (PDT)
Date: Tue, 28 Oct 2025 21:58:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: xiangxu.yin@oss.qualcomm.com, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH v6 1/4] dt-bindings: display: msm: Add SM6150 DisplayPort
 controller
Message-ID: <hzmwjn6xmb3kqvbvhhvycoskor4avtuuaubda5m3vmouten7z7@bvo53uektqln>
References: <20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com>
 <20251024-add-displayport-support-to-qcs615-devicetree-v6-1-c4316975dd0e@oss.qualcomm.com>
 <m6j3sdc4jb2jonzbpez7g3xb6cfputdz34wtydfrx736nqvrv6@o5ntg7csl7dr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m6j3sdc4jb2jonzbpez7g3xb6cfputdz34wtydfrx736nqvrv6@o5ntg7csl7dr>
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=6901206b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=pr-hqIQVVoteFAb5gkcA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Cp7F6kYZoVxrNxR0aS-YtEKCpNCwWnYA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2OCBTYWx0ZWRfX/YCWotpnk8T/
 KQZo4bFZtfBw6jx8za2/DtQKCz0SWAfxLeA8JkXkQ7Jt/ZqKXvXUwe1+AKd2ICzsMD34aAlR8+O
 +UwpW/1d27xQsGtdgDVZO/eBqg9sUpex8AAlJyCHyQt5ToTzBZ86bkuuJ6Kfosv0+6uMCcjb1pE
 pTKWMe5Fwx8JvJgEAMaXP1jGAt1clMwwvcI+AbZ3JKNvtOVKnkfzKsp4V+lg9fbQ58dataxT9Xx
 MOnCBzxDfAs+M/9Sai7mnGR+suuP+eIzKqhqwhKcg1kzsTpGV9GDEMJKSt52ZJpGjsvuGK5ARcn
 pCgASuaH8GbDmfNB0d5XUdSa6ViCDVLPym6ybCrLVIjzDan4A22yKNO6qQmk1NgrGFSTPuZtpii
 333K+QhTBd6LC4PIkAPnamRWyP6awA==
X-Proofpoint-GUID: Cp7F6kYZoVxrNxR0aS-YtEKCpNCwWnYA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280168
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

On Mon, Oct 27, 2025 at 01:54:43PM -0500, Bjorn Andersson wrote:
> On Fri, Oct 24, 2025 at 01:21:01PM +0800, Xiangxu Yin via B4 Relay wrote:
> > From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> > 
> > SM6150 uses the same DisplayPort controller as SM8150, which is already
> > compatible with SM8350. Add the SM6150-specific compatible string and
> > update the binding example accordingly.
> > 
> > Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml      | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> > index 9ac24f99d3ada1c197c9654dc9babebccae972ed..ba0dea2edea98cee0826cf38b3f33361666e004a 100644
> > --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> > @@ -51,6 +51,16 @@ patternProperties:
> >        compatible:
> >          const: qcom,sm6150-dpu
> >  
> > +  "^displayport-controller@[0-9a-f]+$":
> > +    type: object
> > +    additionalProperties: true
> > +    properties:
> > +      compatible:
> > +        items:
> > +          - const: qcom,sm6150-dp
> > +          - const: qcom,sm8150-dp
> 
> Perhaps I'm missing something, but if sm6150-dp is the same controller
> as sm8150-dp, which is the same controller as sm8350-dp...doesn't that
> imply that sm6150-dp is the same as sm8350-dp and we could not mention
> the sm8150-dp here?

sm6150-dp is the same as sm8150-dp. sm8150-dp is compatible with
sm8350-dp, but it's not the same version.

> 
> Regards,
> Bjorn
> 
> > +          - const: qcom,sm8350-dp
> > +
> >    "^dsi@[0-9a-f]+$":
> >      type: object
> >      additionalProperties: true
> > 
> > -- 
> > 2.34.1
> > 
> > 

-- 
With best wishes
Dmitry
